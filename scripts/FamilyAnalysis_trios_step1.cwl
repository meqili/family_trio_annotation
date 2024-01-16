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
            "id": "AR_comphet_input_file",
            "type": "File",
            "inputBinding": {
                "prefix": "--AR_comphet_file",
                "shellQuote": false,
                "position": 1
            },
            "doc": "Input file path for AR_comphet file"
        },
        {
            "id": "spark_driver_mem",
            "type": "int?",
            "doc": "GB of RAM to allocate to this task",
            "default": 10
        },
        {
            "loadListing": "deep_listing",
            "id": "hgmd_var",
            "type": "Directory",
            "inputBinding": {
                "prefix": "--hgmd_var",
                "shellQuote": false,
                "position": 0
            },
            "doc": "the latest HGMD variant  parquet file dir"
        },
        {
            "loadListing": "deep_listing",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "63779b0180315a3645400d9a",
                "name": "dbnsfp"
            },
            "id": "dbnsfp_annovar_parquet",
            "type": "Directory",
            "inputBinding": {
                "prefix": "--dbnsfp",
                "shellQuote": false,
                "position": 0
            },
            "doc": "dbnsfp annovar parquet file dir"
        },
        {
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "64ac20807440d2128961faf9",
                "name": "clinvar_stable"
            },
            "loadListing": "deep_listing",
            "id": "clinvar_parquet",
            "type": "Directory",
            "inputBinding": {
                "prefix": "--clinvar",
                "shellQuote": false,
                "position": 0
            },
            "doc": "clinvar parquet file dir"
        },
        {
            "id": "het_maf",
            "type": "double?",
            "inputBinding": {
                "prefix": "--het_maf",
                "shellQuote": false,
                "position": 0
            },
            "doc": "Set minor allele frequency (MAF) threshold for heterozygotes in gnomAD and TOPMed",
            "default": 0.00001
        },
        {
            "id": "damage_predict_count_lower",
            "type": "double?",
            "inputBinding": {
                "prefix": "--dpc_l",
                "shellQuote": false,
                "position": 0
            },
            "default": 0.5
        },
        {
            "id": "damage_predict_count_upper",
            "type": "double?",
            "inputBinding": {
                "prefix": "--dpc_u",
                "shellQuote": false,
                "position": 0
            },
            "default": 1
        },
        {
            "id": "known_variants_l",
            "type": "string?",
            "inputBinding": {
                "prefix": "--known_variants_l",
                "shellQuote": false,
                "position": 0
            },
            "default": "ClinVar HGMD"
        },
        {
            "id": "sql_broadcastTimeout",
            "type": "int?",
            "doc": ".config(\"spark.sql.broadcastTimeout\", 36000)",
            "default": 36000
        },
        {
            "loadListing": "deep_listing",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6523c97b835293393d732340",
                "name": "gencc20231003"
            },
            "id": "gencc",
            "type": "Directory",
            "inputBinding": {
                "prefix": "--gencc",
                "shellQuote": false,
                "position": 0
            },
            "doc": "gencc parquet file dir"
        },
        {
            "loadListing": "deep_listing",
            "id": "hgmd_gene",
            "type": "Directory",
            "inputBinding": {
                "prefix": "--hgmd_gene",
                "shellQuote": false,
                "position": 0
            }
        },
        {
            "loadListing": "deep_listing",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6377ca03990cd56d5c61b9d0",
                "name": "omim_gene_set"
            },
            "id": "omim_gene",
            "type": "Directory",
            "inputBinding": {
                "prefix": "--omim_gene",
                "shellQuote": true,
                "position": 0
            }
        },
        {
            "loadListing": "deep_listing",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6377ca1a990cd56d5c61ba47",
                "name": "orphanet_gene_set"
            },
            "id": "orphanet_gene",
            "type": "Directory",
            "inputBinding": {
                "prefix": "--orphanet_gene",
                "shellQuote": false,
                "position": 0
            }
        },
        {
            "loadListing": "deep_listing",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6377ca42990cd56d5c61bada",
                "name": "opmed_bravo"
            },
            "id": "topmed",
            "type": "Directory",
            "inputBinding": {
                "prefix": "--topmed",
                "shellQuote": false,
                "position": 0
            }
        },
        {
            "id": "FM_id",
            "type": "string?",
            "inputBinding": {
                "prefix": "--fm_id",
                "shellQuote": false,
                "position": 0
            },
            "doc": "Kids First Family ID, only one allows"
        },
        {
            "id": "hom_maf",
            "type": "double?",
            "inputBinding": {
                "prefix": "--hom_maf",
                "shellQuote": false,
                "position": 0
            },
            "doc": "minor allele frequency (MAF) threshold for homozygotes in gnomAD and TOPMed",
            "default": 0.0001
        },
        {
            "id": "out_input_file",
            "type": "File",
            "inputBinding": {
                "prefix": "--out_file",
                "shellQuote": false,
                "position": 0
            }
        }
    ],
    "outputs": [
        {
            "id": "AR_comphet_output",
            "type": "File?",
            "outputBinding": {
                "glob": "*.AR_comphet.VWB_result.tsv"
            }
        },
        {
            "id": "out_output",
            "type": "File?",
            "outputBinding": {
                "glob": "*.out.VWB_result.tsv"
            }
        }
    ],
    "doc": "Get a list of deleterious variants in interested genes from specified study cohort(s) in the Kids First program.",
    "label": "FamilyAnalysis_trios_step1",
    "arguments": [
        {
            "prefix": "",
            "shellQuote": false,
            "position": 0,
            "valueFrom": "--packages io.projectglow:glow-spark3_2.12:1.1.2  --conf spark.hadoop.io.compression.codecs=io.projectglow.sql.util.BGZFCodec --conf spark.sql.broadcastTimeout=$(inputs.sql_broadcastTimeout) --driver-memory $(inputs.spark_driver_mem)G  FamilyAnalysis_trios_step1.py"
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
                    "entryname": "FamilyAnalysis_trios_step1.py",
                    "entry": "import argparse\nfrom argparse import RawTextHelpFormatter\nimport pyspark\nimport pyspark.sql.functions as F\nfrom pyspark.sql.types import StringType\nimport glow\n\nparser = argparse.ArgumentParser(\n    description='Script of gene based variant filtering. \\n\\\n    MUST BE RUN WITH spark-submit. For example: \\n\\\n    spark-submit --driver-memory 10G yours.py',\n    formatter_class=RawTextHelpFormatter)\n\nparser = argparse.ArgumentParser()\nparser.add_argument('--AR_comphet_file', help='Input file path for AR_comphet file')\nparser.add_argument('--out_file', help='Input file path for out file')\nparser.add_argument('--clinvar', help='clinvar parquet file dir')\nparser.add_argument('--dbnsfp', help='dbnsfp annovar parquet file dir')\nparser.add_argument('--gencc', help='gencc parquet file dir')\nparser.add_argument('--hgmd_var', help='hgmd_var parquet file dir')\nparser.add_argument('--hgmd_gene', help='hgmd_gene parquet file dir')\nparser.add_argument('--omim_gene', help='omim_gene parquet file dir')\nparser.add_argument('--orphanet_gene', help='orphanet_gene parquet file dir')\nparser.add_argument('--topmed', help='topmed parquet file dir')\nparser.add_argument('--fm_id', help='Kids First Family ID, only one allows')\nparser.add_argument('--het_maf', default=0.00001, help='Set minor allele frequency (MAF) threshold for heterozygotes in gnomAD and TOPMed')\nparser.add_argument('--hom_maf', default=0.0001, help='minor allele frequency (MAF) threshold for homozygotes in gnomAD and TOPMed')\nparser.add_argument('--dpc_l', default=0.5,\n        help='damage predict count lower threshold')\nparser.add_argument('--dpc_u', default=1,\n        help='damage predict count upper threshold')\nparser.add_argument('--known_variants_l', nargs='+', default=['ClinVar', 'HGMD'],\n                    help='known variant databases used, default is ClinVar and HGMD')\nargs = parser.parse_args()\n\n# Create spark session\nspark = (\n    pyspark.sql.SparkSession.builder.appName(\"PythonPi\")\n    .getOrCreate()\n    )\n# Register so that glow functions like read vcf work with spark. Must be run in spark shell or in context described in help\nspark = glow.register(spark)\n\n# --------------------------------------\n# Part 1: loading databases \n# --------------------------------------\ncond = ['chromosome', 'start', 'reference', 'alternate']\n# Table ClinVar\nclinvar = spark.read.parquet(args.clinvar)\n# Table dbnsfp_annovar, added a column for ratio of damage predictions to all predictions\ndbnsfp = spark.read.parquet(args.dbnsfp).select(cond + [F.col('DamagePredCount')])\nc_dbn = ['DamagePredCount', 'PredCountRatio_D2T']\nt_dbn = dbnsfp \\\n    .withColumn('PredCountRatio_D2T', \\\n                F.when(F.split(F.col('DamagePredCount'), '_')[1] == 0, F.lit(None).cast(F.StringType())) \\\n                .otherwise(F.split(F.col('DamagePredCount'), '_')[0] / F.split(F.col('DamagePredCount'), '_')[1])) \\\n    .select(cond + c_dbn)\n# GenCC genes\ngencc = spark.read.parquet(args.gencc)\ng_genc = gencc \\\n    .select('gene_symbol', 'disease_curie', 'disease_title', 'classification_title', 'moi_title') \\\n    .withColumnRenamed('gene_symbol', 'GenCC_gene_symbol') \\\n    .withColumnRenamed('disease_curie', 'GenCC_disease_curie') \\\n    .withColumnRenamed('disease_title', 'GenCC_disease_title') \\\n    .withColumnRenamed('classification_title', 'GenCC_classification_title') \\\n    .withColumnRenamed('moi_title', 'GenCC_moi_title') \\\n    .groupBy('GenCC_gene_symbol') \\\n    .agg(F.collect_set('GenCC_disease_curie').alias('GenCC_disease_curie_combined'), \\\n         F.collect_set('GenCC_disease_title').alias('GenCC_disease_title_combined'), \\\n         F.collect_set('GenCC_classification_title').alias('GenCC_classification_title_combined'), \\\n         F.collect_set('GenCC_moi_title').alias('GenCC_moi_title_combined'))\n\nhgmd_var = spark.read.parquet(args.hgmd_var)\n\n# HGMD genes\nhgmd_gene = spark.read.parquet(args.hgmd_gene)\ng_hgmd = hgmd_gene \\\n    .select('entrez_gene_id', 'symbol', 'DM', 'DM?') \\\n    .withColumnRenamed('symbol', 'HGMD_symbol') \\\n    .withColumnRenamed('DM', 'HGMD_DM') \\\n    .withColumnRenamed('DM?', 'HGMD_DM?')\n\n# OMIM genes\nomim_gene = spark.read.parquet(args.omim_gene)\ng_omim = omim_gene \\\n    .select('entrez_gene_id', 'omim_gene_id', 'phenotype') \\\n    .withColumnRenamed('entrez_gene_id', 'OMIM_entrez_gene_id') \\\n    .withColumnRenamed('omim_gene_id', 'OMIM_gene_id') \\\n    .withColumnRenamed('phenotype', 'OMIM_phenotype') \\\n    .groupBy('OMIM_entrez_gene_id') \\\n    .agg(F.collect_set('OMIM_gene_id').alias('OMIM_gene_id'), \\\n         F.collect_set('OMIM_phenotype').cast(StringType()).alias('OMIM_phenotype_combined')) \\\n    .withColumn('OMIM_phenotype_combined', \\\n                F.when(F.col('OMIM_phenotype_combined') == '[]', F.lit(None)).otherwise(F.col('OMIM_phenotype_combined')))\n\n# Orphanet genes\norphanet_gene = spark.read.parquet(args.orphanet_gene)\ng_orph = orphanet_gene \\\n    .select('gene_symbol', 'disorder_id', 'gene_source_of_validation', 'HGNC_gene_id', 'type_of_inheritance') \\\n    .withColumnRenamed('gene_symbol', 'Orphanet_gene_symbol') \\\n    .withColumnRenamed('disorder_id', 'Orphanet_disorder_id') \\\n    .withColumnRenamed('gene_source_of_validation', 'Orphanet_gene_source_of_validation') \\\n    .withColumnRenamed('HGNC_gene_id', 'Orphanet_HGNC_gene_id') \\\n    .withColumnRenamed('type_of_inheritance', 'Orphanet_type_of_inheritance') \\\n    .groupBy('Orphanet_gene_symbol') \\\n    .agg(F.collect_set('Orphanet_disorder_id').cast(StringType()).alias('Orphanet_disorder_id_combined'), \\\n         F.collect_set('Orphanet_gene_source_of_validation').cast(StringType()).alias('Orphanet_gene_source_of_validation_combined'), \\\n         F.collect_set('Orphanet_HGNC_gene_id').cast(StringType()).alias('Orphanet_HGNC_gene_id'), \\\n         F.collect_set('Orphanet_type_of_inheritance').cast(StringType()).alias('Orphanet_type_of_inheritance_combined')) \\\n    .withColumn('Orphanet_type_of_inheritance_combined', \\\n                F.when(F.col('Orphanet_type_of_inheritance_combined') == '[]', F.lit(None)).otherwise(F.col('Orphanet_type_of_inheritance_combined'))) \\\n    .withColumn('Orphanet_gene_source_of_validation_combined', \\\n                F.when(F.col('Orphanet_gene_source_of_validation_combined') == '[]', F.lit(None)).otherwise(F.col('Orphanet_gene_source_of_validation_combined'))) \\\n    .withColumn('Orphanet_HGNC_gene_id', \\\n                F.when(F.col('Orphanet_HGNC_gene_id') == '[]', F.lit(None)).otherwise(F.col('Orphanet_HGNC_gene_id')))\n\ntopmed = spark.read.parquet(args.topmed).select(cond + [F.col('af')])\n\n\n# --------------------------------------\n# part 2: Setting parameters\n# --------------------------------------\n# Keep only high impact variants\nconsequences_to_keep = [\"transcript_ablation\",\n    \"splice_acceptor_variant\",\n    \"splice_donor_variant\",\n    \"stop_gained\",\n    \"frameshift_variant\",\n    \"stop_lost\",\n    \"start_lost\",\n    \"transcript_amplification\",\n    \"inframe_insertion\",\n    \"inframe_deletion\",\n    \"missense_variant\",\n    \"protein_altering_variant\",\n    \"splice_region_variant\",\n    \"incomplete_terminal_codon_variant\",\n    \"start_retained_variant\",\n    \"stop_retained_variant\",\n    \"coding_sequence_variant\"]\n\n# Set minor allele frequency (MAF) threshold for heterozygotes in gnomAD and TOPMed\nhet_maf = args.het_maf # default: 0.00001\n\n# Set minor allele frequency (MAF) threshold for homozygotes in gnomAD and TOPMed\nhom_maf = args.hom_maf # default: 0.0001\n\n# Set range for the ratio of DamagePredCount to AllPredCount in dbNSFP\ndpc_l = args.dpc_l # default: 0.5\ndpc_u = args.dpc_u # default: 1\n\n# Check known variants\nknown_variants_l = args.known_variants_l # default: ('HGMD', 'Clinvar')\n\n# --------------------------------------\n# part 3: running\n# --------------------------------------\nFM_ID = args.fm_id \nfor Inh_type in ['out', 'AR_comphet']:\n    if Inh_type == 'out':\n        input_file = args.out_file\n    else:\n        input_file = args.AR_comphet_file\n    family_out = spark \\\n        .read \\\n        .options(delimiter=\"\\t\", header=True) \\\n        .csv(input_file) \\\n        .withColumnRenamed('CHROM', 'chromosome') \\\n        .withColumnRenamed('POS', 'start') \\\n        .withColumnRenamed('REF', 'reference') \\\n        .withColumnRenamed('ALT', 'alternate') \\\n        .withColumnRenamed('QUAL', 'quality')\n    family_out = family_out \\\n        .withColumn('chromosome', \\\n                    F.when(family_out.chromosome.startswith('chr'), F.regexp_replace('chromosome', 'chr', '')) \\\n                    .otherwise(family_out.chromosome))\n\n    # Keep high impact variants\n    table_imported_exon = family_out \\\n        .where(F.col('CSQ_Consequence').isin(consequences_to_keep))\n\n    # Attach TOPMed and max gnomAD/TOPMed frequencies\n    table_imported_exon = table_imported_exon \\\n        .join(topmed.alias('g'), cond, 'left') \\\n        .select([F.col(x) for x in table_imported_exon.columns] + [F.col('g.af')]) \\\n        .withColumnRenamed('af', 'TOPMed_af')\n    table_imported_exon = table_imported_exon \\\n        .withColumn('max_gnomad_topmed', F.greatest( \\\n            F.lit(0), \\\n            F.col('CSQ_gnomAD_AF').cast('double'), \\\n            F.col('CSQ_gnomAD_exomes_controls_AF').cast('double'), \\\n            F.col('CSQ_ALSPAC_AF').cast('double'), \\\n            F.col('CSQ_TWINSUK_AF').cast('double'), \\\n            F.col('CSQ_UK10K_AF').cast('double'), \\\n            F.col('INFO_gnomad_3_1_1_AF').cast('double'), \\\n            F.col('TOPMed_af').cast('double')))\n\n    # Flag using MAF\n    if Inh_type == 'out':\n        table_imported_exon = table_imported_exon \\\n            .withColumn('flag_keep', F.when(\n                (\n                    (F.col('max_gnomad_topmed') <= het_maf) \\\n                    & F.col('Inheritance').startswith('AD_')\n                ) \\\n                | (\n                    (F.col('max_gnomad_topmed') <= hom_maf) \\\n                    & ((F.col('Inheritance') == 'AR_homo') | F.col('Inheritance').startswith('XLR_'))\n                ), 1).otherwise(0))\n    else: # Inh_type == 'AR_comphet'\n        table_imported_exon = table_imported_exon \\\n            .withColumn('flag_keep', F.when(F.col('max_gnomad_topmed') <= hom_maf, 1).otherwise(0))\n\n    # Table ClinVar, restricted to those seen in variants and labeled as pathogenic/likely_pathogenic\n    c_clv = ['VariationID', 'clin_sig']\n    t_clv = clinvar \\\n        .withColumnRenamed('name', 'VariationID') \\\n        .where((F.array_contains(F.col('clin_sig'), 'Pathogenic') | F.array_contains(F.col('clin_sig'), 'Likely_pathogenic'))) \\\n        .join(table_imported_exon, cond) \\\n        .select(cond + c_clv)\n\n    # Table HGMD, restricted to those seen in variants and labeled as DM or DM?\n    c_hgmd = ['HGMDID', 'variant_class']\n    t_hgmd = hgmd_var \\\n        .withColumnRenamed('id', 'HGMDID') \\\n        .where(F.col('variant_class').startswith('DM')) \\\n        .join(table_imported_exon, cond) \\\n        .select(cond + c_hgmd)\n\n    # Join imported table to dbnsfp, keep variants with PredCountRatio_D2T between dpc_l and dpc_u (both inclusive)\n    table_imported_exon_dbn = table_imported_exon \\\n        .join(t_dbn, cond, how='left') \\\n        .withColumn('flag_keep', F.when((table_imported_exon.flag_keep == 1) \\\n            & F.col('PredCountRatio_D2T').isNotNull() \\\n            & (F.col('PredCountRatio_D2T') >= dpc_l) \\\n            & (F.col('PredCountRatio_D2T') <= dpc_u), 1) \\\n        .otherwise(table_imported_exon.flag_keep))\n    # print(table_imported_exon_dbn.count())\n\n    # Include ClinVar if specified\n    if 'Clinvar' in known_variants_l and t_clv.count() > 0:\n        table_imported_exon_dbn = table_imported_exon_dbn \\\n            .join(t_clv, cond, how='left') \\\n            .withColumn('flag_keep', F.when(F.col('VariationID').isNotNull(), 1) \\\n            .otherwise(table_imported_exon_dbn.flag_keep))\n    # print(table_imported_exon_dbn.count())\n\n    # Include HGMD if specified\n    if 'HGMD' in known_variants_l and t_hgmd.count() > 0:\n        table_imported_exon_dbn = table_imported_exon_dbn \\\n            .join(t_hgmd, cond, how='left') \\\n            .withColumn('flag_keep', F.when(F.col('HGMDID').isNotNull(), 1) \\\n            .otherwise(table_imported_exon_dbn.flag_keep))\n    # print(table_imported_exon_dbn.count())\n\n    # Attach HGMD gene-disease relationships\n    table_imported_exon_dbn_phenotypes = table_imported_exon_dbn \\\n        .join(g_hgmd.alias('g'), table_imported_exon_dbn.CSQ_SYMBOL == g_hgmd.HGMD_symbol, 'left') \\\n        .select([F.col(x) for x in table_imported_exon_dbn.columns] + \\\n                [F.col('g.entrez_gene_id'), \\\n                    F.col('g.HGMD_DM'), \\\n                    F.col('g.HGMD_DM?')])\n\n    # Attach OMIM gene-disease relationships\n    table_imported_exon_dbn_phenotypes = table_imported_exon_dbn_phenotypes \\\n        .join(g_omim.alias('g'), table_imported_exon_dbn_phenotypes.entrez_gene_id == g_omim.OMIM_entrez_gene_id, 'left') \\\n        .select([F.col(x) for x in table_imported_exon_dbn_phenotypes.columns] + \\\n                [F.col('g.OMIM_gene_id'), \\\n                    F.col('g.OMIM_phenotype_combined')])\n\n    # Attach Orphanet gene-disease relationships\n    table_imported_exon_dbn_phenotypes = table_imported_exon_dbn_phenotypes \\\n        .join(g_orph.alias('g'), table_imported_exon_dbn_phenotypes.CSQ_SYMBOL == g_orph.Orphanet_gene_symbol, 'left') \\\n        .select([F.col(x) for x in table_imported_exon_dbn_phenotypes.columns] \\\n            + [F.col('g.Orphanet_disorder_id_combined'), \\\n                F.col('g.Orphanet_gene_source_of_validation_combined'), \\\n                F.col('g.Orphanet_HGNC_gene_id'), \\\n                F.col('g.Orphanet_type_of_inheritance_combined')])\n\n    # Attach GenCC gene-disease relationships\n    table_imported_exon_dbn_phenotypes = table_imported_exon_dbn_phenotypes \\\n        .join(g_genc.alias('g'), table_imported_exon_dbn_phenotypes.CSQ_SYMBOL == g_genc.GenCC_gene_symbol, 'left') \\\n        .select([F.col(x) for x in table_imported_exon_dbn_phenotypes.columns] \\\n            + [F.col('g.GenCC_disease_curie_combined'), \\\n                F.col('g.GenCC_disease_title_combined'), \\\n                F.col('g.GenCC_classification_title_combined'), \\\n                F.col('g.GenCC_moi_title_combined')]) \\\n        .sort(F.asc( \\\n                F.when(F.col('chromosome').isin(['X', 'Y', 'x', 'y']), F.lpad('chromosome', 2, '2')) \\\n                    .otherwise(F.lpad('chromosome', 2, '0')) \\\n                ), \\\n                F.asc(F.col('start'))\n            )\n\n    # Generate output\n    cols_json = [F.to_json(c[0]).alias(c[0]) if c[1].startswith(\"struct\") else F.col(c[0]) for c in table_imported_exon_dbn_phenotypes.dtypes]\n    cols_ws = [F.concat_ws(',', c[0]).alias(c[0]) if c[1].startswith(\"array\") else F.col(c[0]) for c in table_imported_exon_dbn_phenotypes.dtypes]\n    output_file = FM_ID + '.' + Inh_type + '.VWB_result.tsv'\n    table_imported_exon_dbn_phenotypes = table_imported_exon_dbn_phenotypes \\\n        .select(cols_json) \\\n        .select(cols_ws) \\\n        .toPandas() \\\n        .to_csv(output_file, sep='\\t', header=True, index=False, line_terminator='\\n')",
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
            "sbg:modifiedOn": 1704318560,
            "sbg:revisionNotes": null
        }
    ],
    "sbg:image_url": null,
    "sbg:toolAuthor": "Qi Li",
    "sbg:appVersion": [
        "v1.2"
    ],
    "id": "https://cavatica-api.sbgenomics.com/v2/apps/yiran/variant-workbench-testing/familyanalysis-trios-step1/5/raw/",
    "sbg:id": "yiran/variant-workbench-testing/familyanalysis-trios-step1/5",
    "sbg:revision": 0,
    "sbg:revisionNotes": null,
    "sbg:modifiedOn": 1704318560,
    "sbg:modifiedBy": "qqlii44",
    "sbg:createdOn": 1704318560,
    "sbg:createdBy": "qqlii44",
    "sbg:project": "yiran/variant-workbench-testing",
    "sbg:sbgMaintained": false,
    "sbg:validationErrors": [],
    "sbg:contributors": [
        "qqlii44"
    ],
    "sbg:latestRevision": 0,
    "sbg:publisher": "sbg",
    "sbg:content_hash": "af84b136e3bdb51f07345f800201c122f0f015c2b71f3f5ea8b53871d3c2ea166",
    "sbg:workflowLanguage": "CWL"
}
