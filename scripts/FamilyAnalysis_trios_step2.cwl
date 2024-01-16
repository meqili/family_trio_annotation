{
    "class": "CommandLineTool",
    "cwlVersion": "v1.2",
    "$namespaces": {
        "sbg": "https://sevenbridges.com"
    },
    "baseCommand": [
        "spark-submit"
    ],
    "inputs": [
        {
            "id": "AR_comphet_file",
            "type": "File",
            "inputBinding": {
                "prefix": "--AR_comphet_file",
                "shellQuote": false,
                "position": 1
            },
            "doc": "Input file path for AR_comphet VWB results"
        },
        {
            "id": "spark_driver_mem",
            "type": "int?",
            "doc": "GB of RAM to allocate to this task",
            "default": 10
        },
        {
            "id": "out_file",
            "type": "File",
            "inputBinding": {
                "prefix": "--out_file",
                "shellQuote": false,
                "position": 1
            },
            "doc": "Input file path for out VWB results"
        },
        {
            "id": "hpo_obo",
            "type": "File",
            "inputBinding": {
                "prefix": "--hpo_obo",
                "shellQuote": false,
                "position": 1
            },
            "doc": "Path to the HPO file (optional), HPO info can be unavailable for some families"
        },
        {
            "loadListing": "deep_listing",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6538370e734d231eaf3a1860",
                "name": "HPO_phenotype_to_genes"
            },
            "id": "hpo_p2g",
            "type": "Directory",
            "inputBinding": {
                "prefix": "--hpo_p2g",
                "shellQuote": false,
                "position": 0
            },
            "doc": "HPO_phenotype_to_genes parquet file dir"
        },
        {
            "loadListing": "deep_listing",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6557c4c86e8dce4459d17721",
                "name": "gene2refseq_20231109"
            },
            "id": "gene2refseq",
            "type": "Directory",
            "inputBinding": {
                "prefix": "--gene2refseq",
                "shellQuote": false,
                "position": 0
            },
            "doc": "gene2refseq annovar parquet file dir"
        },
        {
            "id": "family_hpo_file",
            "type": "File?",
            "inputBinding": {
                "prefix": "--family_hpo_file",
                "shellQuote": false,
                "position": 0
            },
            "doc": "henotypes (HPOs)"
        },
        {
            "id": "sql_broadcastTimeout",
            "type": "int?",
            "doc": ".config(\"spark.sql.broadcastTimeout\", 36000)",
            "default": 36000
        },
        {
            "id": "fm_id",
            "type": "string",
            "inputBinding": {
                "prefix": "--fm_id",
                "shellQuote": false,
                "position": 0
            },
            "doc": "Kids First Family ID, only one allows"
        }
    ],
    "outputs": [
        {
            "id": "out_HPO_output",
            "type": "File?",
            "outputBinding": {
                "glob": "*.out.VWB_result.HPO.tsv"
            }
        },
        {
            "id": "AR_comphet_HPO_output",
            "type": "File?",
            "outputBinding": {
                "glob": "*.AR_comphet.VWB_result.HPO.tsv"
            }
        }
    ],
    "doc": "Get a list of deleterious variants in interested genes from specified study cohort(s) in the Kids First program.",
    "label": "FamilyAnalysis_trios_step2",
    "arguments": [
        {
            "prefix": "",
            "shellQuote": false,
            "position": 0,
            "valueFrom": "--packages io.projectglow:glow-spark3_2.12:1.1.2  --conf spark.hadoop.io.compression.codecs=io.projectglow.sql.util.BGZFCodec --conf spark.sql.broadcastTimeout=$(inputs.sql_broadcastTimeout) --driver-memory $(inputs.spark_driver_mem)G  FamilyAnalysis_trios_step2.py"
        }
    ],
    "requirements": [
        {
            "class": "ShellCommandRequirement"
        },
        {
            "class": "LoadListingRequirement"
        },
        {
            "class": "ResourceRequirement",
            "coresMin": 16
        },
        {
            "class": "DockerRequirement",
            "dockerPull": "pgc-images.sbgenomics.com/d3b-bixu/pyspark:3.1.2"
        },
        {
            "class": "InitialWorkDirRequirement",
            "listing": [
                {
                    "entryname": "FamilyAnalysis_trios_step2.py",
                    "entry": "import argparse\nfrom argparse import RawTextHelpFormatter\nimport pyspark\nimport pyspark.sql.functions as F\nfrom pyspark.sql.functions import lit\nimport glow\nimport sys\n\nparser = argparse.ArgumentParser(\n    description='Script of gene based variant filtering. \\n\\\n    MUST BE RUN WITH spark-submit. For example: \\n\\\n    spark-submit --driver-memory 10G yours.py',\n    formatter_class=RawTextHelpFormatter)\n\nparser = argparse.ArgumentParser()\nparser.add_argument('--AR_comphet_file', help='Input file path for AR_comphet VWB results')\nparser.add_argument('--out_file', help='Input file path for out VWB results')\nparser.add_argument('--hpo_obo', help='Path to the HPO file')\nparser.add_argument('--hpo_p2g', help='HPO_phenotype_to_genes parquet file dir')\nparser.add_argument('--gene2refseq', help='gene2refseq annovar parquet file dir')\nparser.add_argument('--family_hpo_file', help='Family HPO file，(optional), HPO info can be unavailable for some families')\nparser.add_argument('--fm_id', help='Kids First Family ID, only one allows')\nargs = parser.parse_args()\n\n# --------------------------------------\n# Part 1: Create spark session\n# --------------------------------------\nspark = (\n    pyspark.sql.SparkSession.builder.appName(\"PythonPi\")\n    .getOrCreate()\n    )\n# Register so that glow functions like read vcf work with spark. Must be run in spark shell or in context described in help\nspark = glow.register(spark)\n\n# --------------------------------------\n# Part 2: Loading HPO and gene tables \n# --------------------------------------\n# hpo\nhpo_obo = spark.read.options(delimiter='\\t', header=True, nullValue='').csv(args.hpo_obo)\n\n# phenotype to gene annotation from HPO\nhpo_p2g = spark.read.parquet(args.hpo_p2g)\n\n# gene2refseq from NCBI Gene\ngene2refseq = spark.read.parquet(args.gene2refseq)\nfor name in gene2refseq.schema.names:\n    gene2refseq = gene2refseq.withColumnRenamed(name, name.replace('.', '_'))\ngene2refseq = gene2refseq \\\n    .withColumn('chromosome', F.regexp_extract('genomic_nucleotide_accession_version', '^NC_0+([^0]+)\\.\\d', 1))\n\n\n# --------------------------------------\n# part 3: Loading phenotype information for families\n# --------------------------------------\nFM_ID = args.fm_id\nsample_phenotypes = spark.read.text(args.family_hpo_file) \\\n    .withColumnRenamed(\"value\", \"hpo_terms\") \\\n    .withColumn(\"FamilyID\", lit(FM_ID))\n\n# -------------------------------------------------------------------------\n# part 4: Attaching HPO phenotype-to-gene annotation to results\n# -------------------------------------------------------------------------\nsample_hpo = sample_phenotypes \\\n        .select('hpo_terms')\nsample_hpo = sample_hpo \\\n    .join(hpo_p2g, sample_hpo.hpo_terms == hpo_p2g.hpo_id)\nsample_hpo = sample_hpo \\\n    .join(hpo_obo, sample_hpo.hpo_terms == hpo_obo.id) \\\n    .select('gene_symbol', 'hpo_terms', 'hpo_name', 'definition') \\\n    .distinct()\nsample_hpo = sample_hpo \\\n    .groupby('gene_symbol') \\\n    .agg(F.sort_array(F.collect_list(F.struct('hpo_terms', 'hpo_name', 'definition'))).alias('collected_list')) \\\n    .withColumn('hpo_terms_combined', F.col('collected_list.hpo_terms')) \\\n    .withColumn('hpo_names_combined', F.col('collected_list.hpo_name')) \\\n    .withColumn('hpo_definitions_combined', F.col('collected_list.definition')) \\\n    .drop('collected_list')\n\nfor Inh_type in ['out', 'AR_comphet']:\n    if Inh_type == 'out':\n        input_file = args.out_file\n    else:\n        input_file = args.AR_comphet_file\n    VWB_result = spark \\\n        .read \\\n        .options(delimiter='\\t', header=True, nullValue='-') \\\n        .csv(input_file)\n    \n    # '.' is also null value\n    VWB_result = VWB_result \\\n        .select([F.when(F.col(c) == '.', None).otherwise(F.col(c)).alias(c) for c in VWB_result.columns])\n    \n    if VWB_result.where(F.col('CSQ_SYMBOL').isNull()).count() > 0:\n        # fill in gene symbol using transcript ID\n        VWB_result = VWB_result \\\n            .join(gene2refseq, VWB_result.CSQ_RefSeq == gene2refseq.RNA_nucleotide_accession_version, 'left_outer') \\\n            .select(VWB_result['*'], gene2refseq['Symbol']) \\\n            .withColumnRenamed('Symbol', 'Symbol_by_rna')\n        \n        # fill in gene symbol using chromosomal position\n        VWB_result = VWB_result \\\n            .join(gene2refseq, \\\n                    [VWB_result.chromosome == gene2refseq.chromosome, \\\n                    VWB_result.start.between(gene2refseq.start_position_on_the_genomic_accession, \\\n                                            gene2refseq.end_position_on_the_genomic_accession)], \\\n                    'left_outer') \\\n            .select(VWB_result['*'], gene2refseq['Symbol']) \\\n            .withColumnRenamed('Symbol', 'Symbol_by_position')\n        \n        # CSQ_SYMBOL is good without missing value\n        VWB_result = VWB_result \\\n            .withColumn('CSQ_SYMBOL_new', \\\n                        F.when(F.col('CSQ_SYMBOL').isNotNull(), F.col('CSQ_SYMBOL')) \\\n                        .otherwise( \\\n                                    F.when(F.col('Symbol_by_rna').isNotNull(), F.col('Symbol_by_rna')) \\\n                                    .otherwise(F.col('Symbol_by_position')))) \\\n            .drop('Symbol_by_rna') \\\n            .drop('Symbol_by_position') \\\n            .drop('CSQ_SYMBOL') \\\n            .withColumnRenamed('CSQ_SYMBOL_new', 'CSQ_SYMBOL')\n    VWB_result = VWB_result \\\n        .join(sample_hpo, VWB_result.CSQ_SYMBOL == sample_hpo.gene_symbol, 'left_outer') \\\n        .distinct() \\\n        .sort(F.asc(F.when(F.col('chromosome').isin(['X', 'Y', 'x', 'y']), \\\n                            F.lpad('chromosome', 2, '2')) \\\n                    .otherwise(F.lpad('chromosome', 2, '0'))), \\\n                F.asc(F.col('start'))) \\\n        .drop('gene_symbol')\n    output_file = FM_ID + '.' + Inh_type + '.VWB_result.HPO.tsv'\n    VWB_result = VWB_result \\\n        .toPandas() \\\n        .to_csv(output_file, sep='\\t', header=True, index=False, line_terminator='\\n')",
                    "writable": true
                }
            ]
        },
        {
            "class": "InlineJavascriptRequirement"
        }
    ],
    "sbg:projectName": "Variant WorkBench testing",
    "sbg:revisionsInfo": [
        {
            "sbg:revision": 0,
            "sbg:modifiedBy": "qqlii44",
            "sbg:modifiedOn": 1696395511,
            "sbg:revisionNotes": null
        }
    ],
    "sbg:image_url": null,
    "sbg:toolAuthor": "Qi Li",
    "sbg:appVersion": [
        "v1.2"
    ],
    "id": "https://cavatica-api.sbgenomics.com/v2/apps/yiran/variant-workbench-testing/hpo-by-gene/13/raw/",
    "sbg:id": "yiran/variant-workbench-testing/hpo-by-gene/13",
    "sbg:revision": 0,
    "sbg:revisionNotes": "",
    "sbg:modifiedOn": 1696395511,
    "sbg:modifiedBy": "qqlii44",
    "sbg:createdOn": 1696395511,
    "sbg:createdBy": "qqlii44",
    "sbg:project": "yiran/variant-workbench-testing",
    "sbg:sbgMaintained": false,
    "sbg:validationErrors": [],
    "sbg:contributors": [
        "qqlii44"
    ],
    "sbg:latestRevision": 0,
    "sbg:publisher": "sbg",
    "sbg:content_hash": "a76e3884702d2f49951f2f4ccf4bced3ea72a5847cbd95d1f63543e4b3f4f6fe0",
    "sbg:workflowLanguage": "CWL"
}
