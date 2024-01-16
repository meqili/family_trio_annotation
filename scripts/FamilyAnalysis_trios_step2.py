import argparse
from argparse import RawTextHelpFormatter
import pyspark
import pyspark.sql.functions as F
from pyspark.sql.functions import lit
import glow
import sys

parser = argparse.ArgumentParser(
    description='Script of gene based variant filtering. \n\
    MUST BE RUN WITH spark-submit. For example: \n\
    spark-submit --driver-memory 10G yours.py',
    formatter_class=RawTextHelpFormatter)

parser = argparse.ArgumentParser()
parser.add_argument('--AR_comphet_file', help='Input file path for AR_comphet VWB results')
parser.add_argument('--out_file', help='Input file path for out VWB results')
parser.add_argument('--hpo_obo', help='Path to the HPO file')
parser.add_argument('--hpo_p2g', help='HPO_phenotype_to_genes parquet file dir')
parser.add_argument('--gene2refseq', help='gene2refseq annovar parquet file dir')
parser.add_argument('--family_hpo_file', help='Family HPO file，(optional), HPO info can be unavailable for some families')
parser.add_argument('--fm_id', help='Kids First Family ID, only one allows')
args = parser.parse_args()

# --------------------------------------
# Part 1: Create spark session
# --------------------------------------
spark = (
    pyspark.sql.SparkSession.builder.appName("PythonPi")
    .getOrCreate()
    )
# Register so that glow functions like read vcf work with spark. Must be run in spark shell or in context described in help
spark = glow.register(spark)

# --------------------------------------
# Part 2: Loading HPO and gene tables 
# --------------------------------------
# hpo
hpo_obo = spark.read.options(delimiter='\t', header=True, nullValue='').csv(args.hpo_obo)

# phenotype to gene annotation from HPO
hpo_p2g = spark.read.parquet(args.hpo_p2g)

# gene2refseq from NCBI Gene
gene2refseq = spark.read.parquet(args.gene2refseq)
for name in gene2refseq.schema.names:
    gene2refseq = gene2refseq.withColumnRenamed(name, name.replace('.', '_'))
gene2refseq = gene2refseq \
    .withColumn('chromosome', F.regexp_extract('genomic_nucleotide_accession_version', '^NC_0+([^0]+)\.\d', 1))


# --------------------------------------
# part 3: Loading phenotype information for families
# --------------------------------------
FM_ID = args.fm_id
sample_phenotypes = spark.read.text(args.family_hpo_file) \
    .withColumnRenamed("value", "hpo_terms") \
    .withColumn("FamilyID", lit(FM_ID))

# -------------------------------------------------------------------------
# part 4: Attaching HPO phenotype-to-gene annotation to results
# -------------------------------------------------------------------------
sample_hpo = sample_phenotypes \
        .select('hpo_terms')
sample_hpo = sample_hpo \
    .join(hpo_p2g, sample_hpo.hpo_terms == hpo_p2g.hpo_id)
sample_hpo = sample_hpo \
    .join(hpo_obo, sample_hpo.hpo_terms == hpo_obo.id) \
    .select('gene_symbol', 'hpo_terms', 'hpo_name', 'definition') \
    .distinct()
sample_hpo = sample_hpo \
    .groupby('gene_symbol') \
    .agg(F.sort_array(F.collect_list(F.struct('hpo_terms', 'hpo_name', 'definition'))).alias('collected_list')) \
    .withColumn('hpo_terms_combined', F.col('collected_list.hpo_terms')) \
    .withColumn('hpo_names_combined', F.col('collected_list.hpo_name')) \
    .withColumn('hpo_definitions_combined', F.col('collected_list.definition')) \
    .drop('collected_list')

for Inh_type in ['out', 'AR_comphet']:
    if Inh_type == 'out':
        input_file = args.out_file
    else:
        input_file = args.AR_comphet_file
    VWB_result = spark \
        .read \
        .options(delimiter='\t', header=True, nullValue='-') \
        .csv(input_file)
    
    # '.' is also null value
    VWB_result = VWB_result \
        .select([F.when(F.col(c) == '.', None).otherwise(F.col(c)).alias(c) for c in VWB_result.columns])
    
    if VWB_result.where(F.col('CSQ_SYMBOL').isNull()).count() > 0:
        # fill in gene symbol using transcript ID
        VWB_result = VWB_result \
            .join(gene2refseq, VWB_result.CSQ_RefSeq == gene2refseq.RNA_nucleotide_accession_version, 'left_outer') \
            .select(VWB_result['*'], gene2refseq['Symbol']) \
            .withColumnRenamed('Symbol', 'Symbol_by_rna')
        
        # fill in gene symbol using chromosomal position
        VWB_result = VWB_result \
            .join(gene2refseq, \
                    [VWB_result.chromosome == gene2refseq.chromosome, \
                    VWB_result.start.between(gene2refseq.start_position_on_the_genomic_accession, \
                                            gene2refseq.end_position_on_the_genomic_accession)], \
                    'left_outer') \
            .select(VWB_result['*'], gene2refseq['Symbol']) \
            .withColumnRenamed('Symbol', 'Symbol_by_position')
        
        # CSQ_SYMBOL is good without missing value
        VWB_result = VWB_result \
            .withColumn('CSQ_SYMBOL_new', \
                        F.when(F.col('CSQ_SYMBOL').isNotNull(), F.col('CSQ_SYMBOL')) \
                        .otherwise( \
                                    F.when(F.col('Symbol_by_rna').isNotNull(), F.col('Symbol_by_rna')) \
                                    .otherwise(F.col('Symbol_by_position')))) \
            .drop('Symbol_by_rna') \
            .drop('Symbol_by_position') \
            .drop('CSQ_SYMBOL') \
            .withColumnRenamed('CSQ_SYMBOL_new', 'CSQ_SYMBOL')
    VWB_result = VWB_result \
        .join(sample_hpo, VWB_result.CSQ_SYMBOL == sample_hpo.gene_symbol, 'left_outer') \
        .distinct() \
        .sort(F.asc(F.when(F.col('chromosome').isin(['X', 'Y', 'x', 'y']), \
                            F.lpad('chromosome', 2, '2')) \
                    .otherwise(F.lpad('chromosome', 2, '0'))), \
                F.asc(F.col('start'))) \
        .drop('gene_symbol')
    output_file = FM_ID + '.' + Inh_type + '.VWB_result.HPO.tsv'
    VWB_result = VWB_result \
        .toPandas() \
        .to_csv(output_file, sep='\t', header=True, index=False, line_terminator='\n')