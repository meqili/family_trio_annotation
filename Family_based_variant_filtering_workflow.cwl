{
    "class": "Workflow",
    "cwlVersion": "v1.2",
    "label": "Family based variant filtering workflow (SNV/indel)",
    "$namespaces": {
        "sbg": "https://sevenbridges.com"
    },
    "inputs": [
        {
            "id": "perl_script",
            "type": "File",
            "label": "Gene_VEP_20230913.pl",
            "sbg:suggestedValue": {
                "class": "File",
                "path": "6525e76c835293393d8522ed",
                "name": "Gene_VEP_20230913.pl"
            },
            "sbg:x": 0,
            "sbg:y": 321
        },
        {
            "id": "vep_vcf",
            "type": "File",
            "sbg:x": 0,
            "sbg:y": 0
        },
        {
            "id": "perl_script_1",
            "type": "File",
            "label": "Filter_Family_VCF_20231007.pl",
            "sbg:suggestedValue": {
                "class": "File",
                "path": "652588ee07220f0cc379ebf1",
                "name": "Filter_Family_VCF_20231007.pl"
            },
            "sbg:x": 0,
            "sbg:y": 214
        },
        {
            "id": "ped",
            "type": "File",
            "sbg:x": 0,
            "sbg:y": 428
        },
        {
            "id": "perl_script_2",
            "type": "File",
            "label": "VEP_to_TSV_header_20230915.pl",
            "sbg:suggestedValue": {
                "class": "File",
                "path": "65259aee07220f0cc37b16d4",
                "name": "VEP_to_TSV_header_20231007.pl"
            },
            "sbg:x": 473.6046447753906,
            "sbg:y": 574.5
        },
        {
            "id": "vcf_header",
            "type": "File",
            "label": "vep_105.vcf.header",
            "sbg:suggestedValue": {
                "class": "File",
                "path": "6503dd06a9d33f71224443fe",
                "name": "multi.vqsr.filtered.denovo.vep_105.vcf.header"
            },
            "sbg:x": 473.6046447753906,
            "sbg:y": 467.5
        },
        {
            "id": "topmed",
            "type": "Directory",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6377ca42990cd56d5c61bada",
                "name": "opmed_bravo"
            },
            "sbg:x": 0,
            "sbg:y": 107,
            "loadListing": "deep_listing"
        },
        {
            "id": "orphanet_gene",
            "type": "Directory",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6377ca1a990cd56d5c61ba47",
                "name": "orphanet_gene_set"
            },
            "sbg:x": 0,
            "sbg:y": 535,
            "loadListing": "deep_listing"
        },
        {
            "id": "omim_gene",
            "type": "Directory",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6377ca03990cd56d5c61b9d0",
                "name": "omim_gene_set"
            },
            "sbg:x": 0,
            "sbg:y": 642,
            "loadListing": "deep_listing"
        },
        {
            "id": "hgmd_var",
            "type": "Directory",
            "doc": "the latest HGMD variant  parquet file dir",
            "sbg:x": 0,
            "sbg:y": 963,
            "loadListing": "deep_listing"
        },
        {
            "id": "hgmd_gene",
            "type": "Directory",
            "sbg:x": 0,
            "sbg:y": 1070,
            "loadListing": "deep_listing"
        },
        {
            "id": "gencc",
            "type": "Directory",
            "doc": "gencc parquet file dir",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6523c97b835293393d732340",
                "name": "gencc20231003"
            },
            "sbg:x": 0,
            "sbg:y": 1177,
            "loadListing": "deep_listing"
        },
        {
            "id": "dbnsfp_annovar_parquet",
            "type": "Directory",
            "doc": "dbnsfp annovar parquet file dir",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "63779b0180315a3645400d9a",
                "name": "dbnsfp"
            },
            "sbg:x": 689.1436767578125,
            "sbg:y": 656,
            "loadListing": "deep_listing"
        },
        {
            "id": "clinvar_parquet",
            "type": "Directory",
            "doc": "clinvar parquet file dir",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "64ac20807440d2128961faf9",
                "name": "clinvar_stable"
            },
            "sbg:x": 689.1436767578125,
            "sbg:y": 763,
            "loadListing": "deep_listing"
        },
        {
            "id": "hpo_p2g",
            "type": "Directory",
            "doc": "HPO_phenotype_to_genes parquet file dir",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6538370e734d231eaf3a1860",
                "name": "HPO_phenotype_to_genes"
            },
            "sbg:x": 0,
            "sbg:y": 749,
            "loadListing": "deep_listing"
        },
        {
            "id": "hpo_obo",
            "type": "File",
            "doc": "Path to the HPO file (optional), HPO info can be unavailable for some families",
            "sbg:x": 0,
            "sbg:y": 856
        },
        {
            "id": "gene2refseq",
            "type": "Directory",
            "doc": "gene2refseq annovar parquet file dir",
            "sbg:suggestedValue": {
                "class": "Directory",
                "path": "6557c4c86e8dce4459d17721",
                "name": "gene2refseq_20231109"
            },
            "sbg:x": 1026.4718017578125,
            "sbg:y": 358,
            "loadListing": "deep_listing"
        },
        {
            "id": "fm_id",
            "type": "string",
            "doc": "Kids First Family ID, only one allows",
            "sbg:x": 1026.4718017578125,
            "sbg:y": 465
        },
        {
            "id": "hom_maf",
            "type": "double?",
            "doc": "minor allele frequency (MAF) threshold for homozygotes in gnomAD and TOPMed",
            "default": 0.0001,
            "sbg:exposed": true
        },
        {
            "id": "het_maf",
            "type": "double?",
            "doc": "Set minor allele frequency (MAF) threshold for heterozygotes in gnomAD and TOPMed",
            "default": 0.00001,
            "sbg:exposed": true
        },
        {
            "id": "damage_predict_count_lower",
            "type": "double?",
            "doc": "the lower ratio of DamagePredCount to AllPredCount in dbNSFP",
            "default": 0.5,
            "sbg:exposed": true
        },
        {
            "id": "damage_predict_count_upper",
            "type": "double?",
            "doc": "the upper ratio of DamagePredCount to AllPredCount in dbNSFP",
            "default": 1,
            "sbg:exposed": true
        },
        {
            "id": "known_variants_l",
            "type": [
                "null",
                {
                    "type": "enum",
                    "symbols": [
                        "ClinVar",
                        "HGMD",
                        "ClinVar HGMD"
                    ],
                    "name": "buildver"
                }
            ],
            "doc": "Check known variants in following database(s)",
            "default": "ClinVar HGMD",
            "sbg:exposed": true
        },
        {
            "id": "family_hpo_file",
            "type": "File?",
            "doc": "henotypes (HPOs)",
            "sbg:x": 1026.4718017578125,
            "sbg:y": 819
        },
        {
            "id": "VWB_format",
            "type": "int",
            "default": 1,
            "sbg:exposed": true
        },
        {
            "id": "treat_nocall_as_wildtype",
            "type": "int",
            "default": 1,
            "sbg:exposed": true
        },
        {
            "id": "spark_driver_mem",
            "type": "int?",
            "doc": "GB of RAM to allocate to this task",
            "default": 10,
            "sbg:exposed": true
        },
        {
            "id": "sql_broadcastTimeout",
            "type": "int?",
            "doc": ".config(\"spark.sql.broadcastTimeout\", 36000)",
            "default": 36000,
            "sbg:exposed": true
        },
        {
            "id": "spark_driver_mem_HPO",
            "type": "int?",
            "doc": "GB of RAM to allocate to this task",
            "default": 10,
            "sbg:exposed": true
        },
        {
            "id": "sql_broadcastTimeout_HPO",
            "type": "int?",
            "doc": ".config(\"spark.sql.broadcastTimeout\", 36000)",
            "default": 36000,
            "sbg:exposed": true
        }
    ],
    "outputs": [
        {
            "id": "AR_comphet_output",
            "outputSource": [
                "hpo_by_gene_1/AR_comphet_HPO_output",
                "familyanalysis_trios_step1/AR_comphet_output"
            ],
            "linkMerge": "merge_nested",
            "type": "File?",
            "sbg:x": 1844.2998046875,
            "sbg:y": 642,
            "pickValue": "all_non_null"
        },
        {
            "id": "out_output",
            "outputSource": [
                "hpo_by_gene_1/out_HPO_output",
                "familyanalysis_trios_step1/out_output"
            ],
            "linkMerge": "merge_nested",
            "type": "File?",
            "sbg:x": 1844.2998046875,
            "sbg:y": 535,
            "pickValue": "all_non_null"
        }
    ],
    "steps": [
        {
            "id": "vep_to_annovar",
            "in": [
                {
                    "id": "vep_vcf",
                    "source": "vep_vcf"
                },
                {
                    "id": "perl_script",
                    "source": "perl_script"
                }
            ],
            "out": [
                {
                    "id": "output"
                }
            ],
            "run": {
                "class": "CommandLineTool",
                "cwlVersion": "v1.2",
                "$namespaces": {
                    "sbg": "https://sevenbridges.com"
                },
                "id": "yiran/variant-workbench-testing/vep-to-annovar/1",
                "baseCommand": [
                    "gunzip",
                    "-c"
                ],
                "inputs": [
                    {
                        "id": "vep_vcf",
                        "type": "File"
                    },
                    {
                        "id": "perl_script",
                        "type": "File",
                        "label": "Gene_VEP_20230913.pl"
                    }
                ],
                "outputs": [
                    {
                        "id": "output",
                        "type": "File",
                        "outputBinding": {
                            "glob": "*.Annovar.vcf.gz",
                            "outputEval": "$(inheritMetadata(self, inputs.vep_vcf))"
                        }
                    }
                ],
                "label": "VEP_to_Annovar",
                "arguments": [
                    {
                        "prefix": "",
                        "shellQuote": false,
                        "position": 0,
                        "valueFrom": "$(inputs.vep_vcf.path) | perl $(inputs.perl_script.path) | gzip -c > $(inputs.vep_vcf.nameroot).Annovar.vcf.gz"
                    }
                ],
                "requirements": [
                    {
                        "class": "ShellCommandRequirement"
                    },
                    {
                        "class": "ResourceRequirement",
                        "ramMin": 10,
                        "coresMin": 1
                    },
                    {
                        "class": "DockerRequirement",
                        "dockerPull": "kfdrc/vep:r93_v2"
                    },
                    {
                        "class": "InlineJavascriptRequirement",
                        "expressionLib": [
                            "\nvar setMetadata = function(file, metadata) {\n    if (!('metadata' in file)) {\n        file['metadata'] = {}\n    }\n    for (var key in metadata) {\n        file['metadata'][key] = metadata[key];\n    }\n    return file\n};\nvar inheritMetadata = function(o1, o2) {\n    var commonMetadata = {};\n    if (!o2) {\n        return o1;\n    };\n    if (!Array.isArray(o2)) {\n        o2 = [o2]\n    }\n    for (var i = 0; i < o2.length; i++) {\n        var example = o2[i]['metadata'];\n        for (var key in example) {\n            if (i == 0)\n                commonMetadata[key] = example[key];\n            else {\n                if (!(commonMetadata[key] == example[key])) {\n                    delete commonMetadata[key]\n                }\n            }\n        }\n        for (var key in commonMetadata) {\n            if (!(key in example)) {\n                delete commonMetadata[key]\n            }\n        }\n    }\n    if (!Array.isArray(o1)) {\n        o1 = setMetadata(o1, commonMetadata)\n        if (o1.secondaryFiles) {\n            o1.secondaryFiles = inheritMetadata(o1.secondaryFiles, o2)\n        }\n    } else {\n        for (var i = 0; i < o1.length; i++) {\n            o1[i] = setMetadata(o1[i], commonMetadata)\n            if (o1[i].secondaryFiles) {\n                o1[i].secondaryFiles = inheritMetadata(o1[i].secondaryFiles, o2)\n            }\n        }\n    }\n    return o1;\n};"
                        ]
                    }
                ],
                "sbg:projectName": "Variant WorkBench testing",
                "sbg:revisionsInfo": [
                    {
                        "sbg:revision": 0,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694622920,
                        "sbg:revisionNotes": null
                    },
                    {
                        "sbg:revision": 1,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694623291,
                        "sbg:revisionNotes": "first version"
                    }
                ],
                "sbg:image_url": null,
                "sbg:appVersion": [
                    "v1.2"
                ],
                "sbg:id": "yiran/variant-workbench-testing/vep-to-annovar/1",
                "sbg:revision": 1,
                "sbg:revisionNotes": "first version",
                "sbg:modifiedOn": 1694623291,
                "sbg:modifiedBy": "yiran",
                "sbg:createdOn": 1694622920,
                "sbg:createdBy": "yiran",
                "sbg:project": "yiran/variant-workbench-testing",
                "sbg:sbgMaintained": false,
                "sbg:validationErrors": [],
                "sbg:contributors": [
                    "yiran"
                ],
                "sbg:latestRevision": 1,
                "sbg:publisher": "sbg",
                "sbg:content_hash": "ad660a736f5a9bd8f2b790566296d96e9a2b66d0b6c143db86e1d343b1c6aaba6",
                "sbg:workflowLanguage": "CWL"
            },
            "label": "VEP_to_Annovar",
            "sbg:x": 207.203125,
            "sbg:y": 581.5
        },
        {
            "id": "filter_family_vcf_20230912",
            "in": [
                {
                    "id": "vcf",
                    "source": "vep_to_annovar/output"
                },
                {
                    "id": "ped",
                    "source": "ped"
                },
                {
                    "id": "perl_script",
                    "source": "perl_script_1"
                },
                {
                    "id": "treat_nocall_as_wildtype",
                    "default": 1,
                    "source": "treat_nocall_as_wildtype"
                },
                {
                    "id": "VWB_format",
                    "default": 1,
                    "source": "VWB_format"
                }
            ],
            "out": [
                {
                    "id": "out"
                },
                {
                    "id": "AR_CH"
                }
            ],
            "run": {
                "class": "CommandLineTool",
                "cwlVersion": "v1.2",
                "$namespaces": {
                    "sbg": "https://sevenbridges.com"
                },
                "id": "yiran/variant-workbench-testing/filter-family-vcf-20230912/2",
                "baseCommand": [
                    "gunzip",
                    "-c"
                ],
                "inputs": [
                    {
                        "id": "vcf",
                        "type": "File"
                    },
                    {
                        "id": "ped",
                        "type": "File"
                    },
                    {
                        "id": "perl_script",
                        "type": "File"
                    },
                    {
                        "id": "treat_nocall_as_wildtype",
                        "type": "int",
                        "default": 1
                    },
                    {
                        "id": "VWB_format",
                        "type": "int",
                        "default": 1
                    }
                ],
                "outputs": [
                    {
                        "id": "out",
                        "type": "File",
                        "outputBinding": {
                            "glob": "*.out",
                            "outputEval": "$(inheritMetadata(self, inputs.vcf))"
                        }
                    },
                    {
                        "id": "AR_CH",
                        "type": "File",
                        "outputBinding": {
                            "glob": "*.AR_comphet",
                            "outputEval": "$(inheritMetadata(self, inputs.vcf))"
                        }
                    }
                ],
                "label": "Filter_family_VCF_20230912",
                "arguments": [
                    {
                        "prefix": "",
                        "shellQuote": false,
                        "position": 0,
                        "valueFrom": "$(inputs.vcf.path) > $(inputs.vcf.nameroot).vcf; perl $(inputs.perl_script.path) $(inputs.ped.path) $(inputs.vcf.nameroot).vcf $(inputs.treat_nocall_as_wildtype) $(inputs.VWB_format)"
                    }
                ],
                "requirements": [
                    {
                        "class": "ShellCommandRequirement"
                    },
                    {
                        "class": "ResourceRequirement",
                        "ramMin": 1024,
                        "coresMin": 1
                    },
                    {
                        "class": "DockerRequirement",
                        "dockerPull": "kfdrc/vep:r93_v2"
                    },
                    {
                        "class": "InlineJavascriptRequirement",
                        "expressionLib": [
                            "\nvar setMetadata = function(file, metadata) {\n    if (!('metadata' in file)) {\n        file['metadata'] = {}\n    }\n    for (var key in metadata) {\n        file['metadata'][key] = metadata[key];\n    }\n    return file\n};\nvar inheritMetadata = function(o1, o2) {\n    var commonMetadata = {};\n    if (!o2) {\n        return o1;\n    };\n    if (!Array.isArray(o2)) {\n        o2 = [o2]\n    }\n    for (var i = 0; i < o2.length; i++) {\n        var example = o2[i]['metadata'];\n        for (var key in example) {\n            if (i == 0)\n                commonMetadata[key] = example[key];\n            else {\n                if (!(commonMetadata[key] == example[key])) {\n                    delete commonMetadata[key]\n                }\n            }\n        }\n        for (var key in commonMetadata) {\n            if (!(key in example)) {\n                delete commonMetadata[key]\n            }\n        }\n    }\n    if (!Array.isArray(o1)) {\n        o1 = setMetadata(o1, commonMetadata)\n        if (o1.secondaryFiles) {\n            o1.secondaryFiles = inheritMetadata(o1.secondaryFiles, o2)\n        }\n    } else {\n        for (var i = 0; i < o1.length; i++) {\n            o1[i] = setMetadata(o1[i], commonMetadata)\n            if (o1[i].secondaryFiles) {\n                o1[i].secondaryFiles = inheritMetadata(o1[i].secondaryFiles, o2)\n            }\n        }\n    }\n    return o1;\n};"
                        ]
                    }
                ],
                "sbg:projectName": "Variant WorkBench testing",
                "sbg:revisionsInfo": [
                    {
                        "sbg:revision": 0,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694542147,
                        "sbg:revisionNotes": null
                    },
                    {
                        "sbg:revision": 1,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694543299,
                        "sbg:revisionNotes": "First draft"
                    },
                    {
                        "sbg:revision": 2,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694543909,
                        "sbg:revisionNotes": ""
                    }
                ],
                "sbg:image_url": null,
                "sbg:appVersion": [
                    "v1.2"
                ],
                "sbg:id": "yiran/variant-workbench-testing/filter-family-vcf-20230912/2",
                "sbg:revision": 2,
                "sbg:revisionNotes": "",
                "sbg:modifiedOn": 1694543909,
                "sbg:modifiedBy": "yiran",
                "sbg:createdOn": 1694542147,
                "sbg:createdBy": "yiran",
                "sbg:project": "yiran/variant-workbench-testing",
                "sbg:sbgMaintained": false,
                "sbg:validationErrors": [],
                "sbg:contributors": [
                    "yiran"
                ],
                "sbg:latestRevision": 2,
                "sbg:publisher": "sbg",
                "sbg:content_hash": "a02bb314807f7f17c5ac19c1cc31eac9469fd31241c4639f8e8de8c3e4075f416",
                "sbg:workflowLanguage": "CWL"
            },
            "label": "Filter_family_VCF_20230912",
            "sbg:x": 473.6046447753906,
            "sbg:y": 695.5
        },
        {
            "id": "vep_vcf_to_tsv_header",
            "in": [
                {
                    "id": "vcf_header",
                    "source": "vcf_header"
                },
                {
                    "id": "FM_out_wo_header",
                    "source": "filter_family_vcf_20230912/out"
                },
                {
                    "id": "perl_script",
                    "source": "perl_script_2"
                }
            ],
            "out": [
                {
                    "id": "output"
                }
            ],
            "run": {
                "class": "CommandLineTool",
                "cwlVersion": "v1.2",
                "$namespaces": {
                    "sbg": "https://sevenbridges.com"
                },
                "id": "yiran/variant-workbench-testing/vep-vcf-to-tsv-header/7",
                "baseCommand": [],
                "inputs": [
                    {
                        "id": "vcf_header",
                        "type": "File"
                    },
                    {
                        "id": "FM_out_wo_header",
                        "type": "File"
                    },
                    {
                        "id": "perl_script",
                        "type": "File",
                        "label": "VEP_to_TSV_header_20230915.pl"
                    }
                ],
                "outputs": [
                    {
                        "id": "output",
                        "type": "File",
                        "outputBinding": {
                            "glob": "*.tsv.gz",
                            "outputEval": "$(inheritMetadata(self, inputs.FM_out_wo_header))"
                        }
                    }
                ],
                "label": "VEP_vcf_to_TSV_header",
                "arguments": [
                    {
                        "prefix": "",
                        "shellQuote": false,
                        "position": 0,
                        "valueFrom": "perl $(inputs.perl_script.path) $(inputs.vcf_header.path) $(inputs.FM_out_wo_header.path) | gzip -c > $(inputs.FM_out_wo_header.basename).tsv.gz"
                    }
                ],
                "requirements": [
                    {
                        "class": "ShellCommandRequirement"
                    },
                    {
                        "class": "ResourceRequirement",
                        "ramMin": 100,
                        "coresMin": 1
                    },
                    {
                        "class": "DockerRequirement",
                        "dockerPull": "kfdrc/vep:r93_v2"
                    },
                    {
                        "class": "InlineJavascriptRequirement",
                        "expressionLib": [
                            "\nvar setMetadata = function(file, metadata) {\n    if (!('metadata' in file)) {\n        file['metadata'] = {}\n    }\n    for (var key in metadata) {\n        file['metadata'][key] = metadata[key];\n    }\n    return file\n};\nvar inheritMetadata = function(o1, o2) {\n    var commonMetadata = {};\n    if (!o2) {\n        return o1;\n    };\n    if (!Array.isArray(o2)) {\n        o2 = [o2]\n    }\n    for (var i = 0; i < o2.length; i++) {\n        var example = o2[i]['metadata'];\n        for (var key in example) {\n            if (i == 0)\n                commonMetadata[key] = example[key];\n            else {\n                if (!(commonMetadata[key] == example[key])) {\n                    delete commonMetadata[key]\n                }\n            }\n        }\n        for (var key in commonMetadata) {\n            if (!(key in example)) {\n                delete commonMetadata[key]\n            }\n        }\n    }\n    if (!Array.isArray(o1)) {\n        o1 = setMetadata(o1, commonMetadata)\n        if (o1.secondaryFiles) {\n            o1.secondaryFiles = inheritMetadata(o1.secondaryFiles, o2)\n        }\n    } else {\n        for (var i = 0; i < o1.length; i++) {\n            o1[i] = setMetadata(o1[i], commonMetadata)\n            if (o1[i].secondaryFiles) {\n                o1[i].secondaryFiles = inheritMetadata(o1[i].secondaryFiles, o2)\n            }\n        }\n    }\n    return o1;\n};"
                        ]
                    }
                ],
                "sbg:projectName": "Variant WorkBench testing",
                "sbg:revisionsInfo": [
                    {
                        "sbg:revision": 0,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694752101,
                        "sbg:revisionNotes": null
                    },
                    {
                        "sbg:revision": 1,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694752341,
                        "sbg:revisionNotes": "first draft"
                    },
                    {
                        "sbg:revision": 2,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694752384,
                        "sbg:revisionNotes": "gzip the output"
                    },
                    {
                        "sbg:revision": 3,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694752502,
                        "sbg:revisionNotes": "added perl script"
                    },
                    {
                        "sbg:revision": 4,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694753244,
                        "sbg:revisionNotes": "update input port to perl_script"
                    },
                    {
                        "sbg:revision": 5,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694753322,
                        "sbg:revisionNotes": "updated label for input port perl_script"
                    },
                    {
                        "sbg:revision": 6,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694753474,
                        "sbg:revisionNotes": "updated arguments: $(inputs.FM_out_wo_header.nameroot).tsv.gz"
                    },
                    {
                        "sbg:revision": 7,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694787865,
                        "sbg:revisionNotes": "Changed inputs.FM_out_wo_header.nameroot to .basename for output"
                    }
                ],
                "sbg:image_url": null,
                "sbg:appVersion": [
                    "v1.2"
                ],
                "sbg:id": "yiran/variant-workbench-testing/vep-vcf-to-tsv-header/7",
                "sbg:revision": 7,
                "sbg:revisionNotes": "Changed inputs.FM_out_wo_header.nameroot to .basename for output",
                "sbg:modifiedOn": 1694787865,
                "sbg:modifiedBy": "yiran",
                "sbg:createdOn": 1694752101,
                "sbg:createdBy": "yiran",
                "sbg:project": "yiran/variant-workbench-testing",
                "sbg:sbgMaintained": false,
                "sbg:validationErrors": [],
                "sbg:contributors": [
                    "yiran"
                ],
                "sbg:latestRevision": 7,
                "sbg:publisher": "sbg",
                "sbg:content_hash": "a7b7100ea0553316e5c2a225b291df11cb515cf51022c90ec9b1c1197f022a956",
                "sbg:workflowLanguage": "CWL"
            },
            "label": "VEP_vcf_to_TSV_header",
            "sbg:x": 689.1436767578125,
            "sbg:y": 535
        },
        {
            "id": "vep_vcf_to_tsv_header_1",
            "in": [
                {
                    "id": "vcf_header",
                    "source": "vcf_header"
                },
                {
                    "id": "FM_out_wo_header",
                    "source": "filter_family_vcf_20230912/AR_CH"
                },
                {
                    "id": "perl_script",
                    "source": "perl_script_2"
                }
            ],
            "out": [
                {
                    "id": "output"
                }
            ],
            "run": {
                "class": "CommandLineTool",
                "cwlVersion": "v1.2",
                "$namespaces": {
                    "sbg": "https://sevenbridges.com"
                },
                "id": "yiran/variant-workbench-testing/vep-vcf-to-tsv-header/7",
                "baseCommand": [],
                "inputs": [
                    {
                        "id": "vcf_header",
                        "type": "File"
                    },
                    {
                        "id": "FM_out_wo_header",
                        "type": "File"
                    },
                    {
                        "id": "perl_script",
                        "type": "File",
                        "label": "VEP_to_TSV_header_20230915.pl"
                    }
                ],
                "outputs": [
                    {
                        "id": "output",
                        "type": "File",
                        "outputBinding": {
                            "glob": "*.tsv.gz",
                            "outputEval": "$(inheritMetadata(self, inputs.FM_out_wo_header))"
                        }
                    }
                ],
                "label": "VEP_vcf_to_TSV_header",
                "arguments": [
                    {
                        "prefix": "",
                        "shellQuote": false,
                        "position": 0,
                        "valueFrom": "perl $(inputs.perl_script.path) $(inputs.vcf_header.path) $(inputs.FM_out_wo_header.path) | gzip -c > $(inputs.FM_out_wo_header.basename).tsv.gz"
                    }
                ],
                "requirements": [
                    {
                        "class": "ShellCommandRequirement"
                    },
                    {
                        "class": "ResourceRequirement",
                        "ramMin": 100,
                        "coresMin": 1
                    },
                    {
                        "class": "DockerRequirement",
                        "dockerPull": "kfdrc/vep:r93_v2"
                    },
                    {
                        "class": "InlineJavascriptRequirement",
                        "expressionLib": [
                            "\nvar setMetadata = function(file, metadata) {\n    if (!('metadata' in file)) {\n        file['metadata'] = {}\n    }\n    for (var key in metadata) {\n        file['metadata'][key] = metadata[key];\n    }\n    return file\n};\nvar inheritMetadata = function(o1, o2) {\n    var commonMetadata = {};\n    if (!o2) {\n        return o1;\n    };\n    if (!Array.isArray(o2)) {\n        o2 = [o2]\n    }\n    for (var i = 0; i < o2.length; i++) {\n        var example = o2[i]['metadata'];\n        for (var key in example) {\n            if (i == 0)\n                commonMetadata[key] = example[key];\n            else {\n                if (!(commonMetadata[key] == example[key])) {\n                    delete commonMetadata[key]\n                }\n            }\n        }\n        for (var key in commonMetadata) {\n            if (!(key in example)) {\n                delete commonMetadata[key]\n            }\n        }\n    }\n    if (!Array.isArray(o1)) {\n        o1 = setMetadata(o1, commonMetadata)\n        if (o1.secondaryFiles) {\n            o1.secondaryFiles = inheritMetadata(o1.secondaryFiles, o2)\n        }\n    } else {\n        for (var i = 0; i < o1.length; i++) {\n            o1[i] = setMetadata(o1[i], commonMetadata)\n            if (o1[i].secondaryFiles) {\n                o1[i].secondaryFiles = inheritMetadata(o1[i].secondaryFiles, o2)\n            }\n        }\n    }\n    return o1;\n};"
                        ]
                    }
                ],
                "sbg:projectName": "Variant WorkBench testing",
                "sbg:revisionsInfo": [
                    {
                        "sbg:revision": 0,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694752101,
                        "sbg:revisionNotes": null
                    },
                    {
                        "sbg:revision": 1,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694752341,
                        "sbg:revisionNotes": "first draft"
                    },
                    {
                        "sbg:revision": 2,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694752384,
                        "sbg:revisionNotes": "gzip the output"
                    },
                    {
                        "sbg:revision": 3,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694752502,
                        "sbg:revisionNotes": "added perl script"
                    },
                    {
                        "sbg:revision": 4,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694753244,
                        "sbg:revisionNotes": "update input port to perl_script"
                    },
                    {
                        "sbg:revision": 5,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694753322,
                        "sbg:revisionNotes": "updated label for input port perl_script"
                    },
                    {
                        "sbg:revision": 6,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694753474,
                        "sbg:revisionNotes": "updated arguments: $(inputs.FM_out_wo_header.nameroot).tsv.gz"
                    },
                    {
                        "sbg:revision": 7,
                        "sbg:modifiedBy": "yiran",
                        "sbg:modifiedOn": 1694787865,
                        "sbg:revisionNotes": "Changed inputs.FM_out_wo_header.nameroot to .basename for output"
                    }
                ],
                "sbg:image_url": null,
                "sbg:appVersion": [
                    "v1.2"
                ],
                "sbg:id": "yiran/variant-workbench-testing/vep-vcf-to-tsv-header/7",
                "sbg:revision": 7,
                "sbg:revisionNotes": "Changed inputs.FM_out_wo_header.nameroot to .basename for output",
                "sbg:modifiedOn": 1694787865,
                "sbg:modifiedBy": "yiran",
                "sbg:createdOn": 1694752101,
                "sbg:createdBy": "yiran",
                "sbg:project": "yiran/variant-workbench-testing",
                "sbg:sbgMaintained": false,
                "sbg:validationErrors": [],
                "sbg:contributors": [
                    "yiran"
                ],
                "sbg:latestRevision": 7,
                "sbg:publisher": "sbg",
                "sbg:content_hash": "a7b7100ea0553316e5c2a225b291df11cb515cf51022c90ec9b1c1197f022a956",
                "sbg:workflowLanguage": "CWL"
            },
            "label": "VEP_vcf_to_TSV_header",
            "sbg:x": 689.1436767578125,
            "sbg:y": 400
        },
        {
            "id": "familyanalysis_trios_step1",
            "in": [
                {
                    "id": "AR_comphet_input_file",
                    "source": "vep_vcf_to_tsv_header_1/output"
                },
                {
                    "id": "spark_driver_mem",
                    "source": "spark_driver_mem"
                },
                {
                    "id": "hgmd_var",
                    "source": "hgmd_var",
                    "loadListing": "deep_listing"
                },
                {
                    "id": "dbnsfp_annovar_parquet",
                    "source": "dbnsfp_annovar_parquet",
                    "loadListing": "deep_listing"
                },
                {
                    "id": "clinvar_parquet",
                    "source": "clinvar_parquet",
                    "loadListing": "deep_listing"
                },
                {
                    "id": "het_maf",
                    "source": "het_maf"
                },
                {
                    "id": "damage_predict_count_lower",
                    "source": "damage_predict_count_lower"
                },
                {
                    "id": "damage_predict_count_upper",
                    "source": "damage_predict_count_upper"
                },
                {
                    "id": "known_variants_l",
                    "linkMerge": "merge_flattened",
                    "source": [
                        "known_variants_l"
                    ]
                },
                {
                    "id": "sql_broadcastTimeout",
                    "source": "sql_broadcastTimeout"
                },
                {
                    "id": "gencc",
                    "source": "gencc",
                    "loadListing": "deep_listing"
                },
                {
                    "id": "hgmd_gene",
                    "source": "hgmd_gene",
                    "loadListing": "deep_listing"
                },
                {
                    "id": "omim_gene",
                    "source": "omim_gene",
                    "loadListing": "deep_listing"
                },
                {
                    "id": "orphanet_gene",
                    "source": "orphanet_gene",
                    "loadListing": "deep_listing"
                },
                {
                    "id": "topmed",
                    "source": "topmed",
                    "loadListing": "deep_listing"
                },
                {
                    "id": "FM_id",
                    "source": "fm_id"
                },
                {
                    "id": "hom_maf",
                    "source": "hom_maf"
                },
                {
                    "id": "out_input_file",
                    "source": "vep_vcf_to_tsv_header/output"
                }
            ],
            "out": [
                {
                    "id": "AR_comphet_output"
                },
                {
                    "id": "out_output"
                }
            ],
            "run": {
                "class": "CommandLineTool",
                "cwlVersion": "v1.2",
                "$namespaces": {
                    "sbg": "https://sevenbridges.com"
                },
                "id": "yiran/variant-workbench-testing/familyanalysis-trios-step1/5",
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
                        "type": [
                            "null",
                            {
                                "type": "enum",
                                "symbols": [
                                    "ClinVar",
                                    "HGMD",
                                    "ClinVar HGMD"
                                ],
                                "name": "buildver"
                            }
                        ],
                        "inputBinding": {
                            "prefix": "--known_variants_l",
                            "shellQuote": false,
                            "position": 0
                        },
                        "doc": "Check known variants in following database(s)",
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
                        "sbg:revisionNotes": "Copy of yiran/variant-workbench-testing/gene-based-variant-filtering/38"
                    },
                    {
                        "sbg:revision": 1,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704318699,
                        "sbg:revisionNotes": "changed name"
                    },
                    {
                        "sbg:revision": 2,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704319644,
                        "sbg:revisionNotes": "updated inputs and outputs"
                    },
                    {
                        "sbg:revision": 3,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704387517,
                        "sbg:revisionNotes": "updated input dirs"
                    },
                    {
                        "sbg:revision": 4,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704820091,
                        "sbg:revisionNotes": "remove driver-memory"
                    },
                    {
                        "sbg:revision": 5,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704833574,
                        "sbg:revisionNotes": "set 16 minCPU"
                    }
                ],
                "sbg:image_url": null,
                "sbg:toolAuthor": "Qi Li",
                "sbg:appVersion": [
                    "v1.2"
                ],
                "sbg:id": "yiran/variant-workbench-testing/familyanalysis-trios-step1/5",
                "sbg:revision": 5,
                "sbg:revisionNotes": "set 16 minCPU",
                "sbg:modifiedOn": 1704833574,
                "sbg:modifiedBy": "qqlii44",
                "sbg:createdOn": 1704318560,
                "sbg:createdBy": "qqlii44",
                "sbg:project": "yiran/variant-workbench-testing",
                "sbg:sbgMaintained": false,
                "sbg:validationErrors": [],
                "sbg:contributors": [
                    "qqlii44"
                ],
                "sbg:latestRevision": 5,
                "sbg:publisher": "sbg",
                "sbg:content_hash": "af84b136e3bdb51f07345f800201c122f0f015c2b71f3f5ea8b53871d3c2ea166",
                "sbg:workflowLanguage": "CWL"
            },
            "label": "FamilyAnalysis_trios_step1",
            "hints": [
                {
                    "class": "sbg:AWSInstanceType"
                }
            ],
            "sbg:x": 1026.4718017578125,
            "sbg:y": 642
        },
        {
            "id": "hpo_by_gene_1",
            "in": [
                {
                    "id": "AR_comphet_file",
                    "source": "familyanalysis_trios_step1/AR_comphet_output"
                },
                {
                    "id": "spark_driver_mem",
                    "source": "spark_driver_mem_HPO"
                },
                {
                    "id": "out_file",
                    "source": "familyanalysis_trios_step1/out_output"
                },
                {
                    "id": "hpo_obo",
                    "source": "hpo_obo"
                },
                {
                    "id": "hpo_p2g",
                    "source": "hpo_p2g",
                    "loadListing": "deep_listing"
                },
                {
                    "id": "gene2refseq",
                    "source": "gene2refseq",
                    "loadListing": "deep_listing"
                },
                {
                    "id": "family_hpo_file",
                    "source": "family_hpo_file"
                },
                {
                    "id": "sql_broadcastTimeout",
                    "source": "sql_broadcastTimeout_HPO"
                },
                {
                    "id": "fm_id",
                    "linkMerge": "merge_flattened",
                    "source": [
                        "fm_id"
                    ]
                }
            ],
            "out": [
                {
                    "id": "out_HPO_output"
                },
                {
                    "id": "AR_comphet_HPO_output"
                }
            ],
            "run": {
                "class": "CommandLineTool",
                "cwlVersion": "v1.2",
                "$namespaces": {
                    "sbg": "https://sevenbridges.com"
                },
                "id": "yiran/variant-workbench-testing/hpo-by-gene/13",
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
                        "sbg:revisionNotes": "Copy of yiran/variant-workbench-testing/gene-based-variant-filtering/38"
                    },
                    {
                        "sbg:revision": 1,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704475082,
                        "sbg:revisionNotes": ""
                    },
                    {
                        "sbg:revision": 2,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704482094,
                        "sbg:revisionNotes": ""
                    },
                    {
                        "sbg:revision": 3,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704727232,
                        "sbg:revisionNotes": ""
                    },
                    {
                        "sbg:revision": 4,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704728788,
                        "sbg:revisionNotes": ""
                    },
                    {
                        "sbg:revision": 5,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704729684,
                        "sbg:revisionNotes": ""
                    },
                    {
                        "sbg:revision": 6,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704744301,
                        "sbg:revisionNotes": ""
                    },
                    {
                        "sbg:revision": 7,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704744418,
                        "sbg:revisionNotes": "removed hpo_obo"
                    },
                    {
                        "sbg:revision": 8,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704745111,
                        "sbg:revisionNotes": ""
                    },
                    {
                        "sbg:revision": 9,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704818898,
                        "sbg:revisionNotes": ""
                    },
                    {
                        "sbg:revision": 10,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704820147,
                        "sbg:revisionNotes": "remove driver-memory"
                    },
                    {
                        "sbg:revision": 11,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704833521,
                        "sbg:revisionNotes": "set 16 minCPU"
                    },
                    {
                        "sbg:revision": 12,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704923691,
                        "sbg:revisionNotes": ""
                    },
                    {
                        "sbg:revision": 13,
                        "sbg:modifiedBy": "qqlii44",
                        "sbg:modifiedOn": 1704923743,
                        "sbg:revisionNotes": ""
                    }
                ],
                "sbg:image_url": null,
                "sbg:toolAuthor": "Qi Li",
                "sbg:appVersion": [
                    "v1.2"
                ],
                "sbg:id": "yiran/variant-workbench-testing/hpo-by-gene/13",
                "sbg:revision": 13,
                "sbg:revisionNotes": "",
                "sbg:modifiedOn": 1704923743,
                "sbg:modifiedBy": "qqlii44",
                "sbg:createdOn": 1696395511,
                "sbg:createdBy": "qqlii44",
                "sbg:project": "yiran/variant-workbench-testing",
                "sbg:sbgMaintained": false,
                "sbg:validationErrors": [],
                "sbg:contributors": [
                    "qqlii44"
                ],
                "sbg:latestRevision": 13,
                "sbg:publisher": "sbg",
                "sbg:content_hash": "a76e3884702d2f49951f2f4ccf4bced3ea72a5847cbd95d1f63543e4b3f4f6fe0",
                "sbg:workflowLanguage": "CWL"
            },
            "label": "FamilyAnalysis_trios_step2",
            "sbg:x": 1469.1514892578125,
            "sbg:y": 546.5,
            "when": "$(inputs.family_hpo_file != null)"
        }
    ],
    "requirements": [
        {
            "class": "LoadListingRequirement"
        },
        {
            "class": "InlineJavascriptRequirement"
        },
        {
            "class": "StepInputExpressionRequirement"
        }
    ],
    "sbg:projectName": "Variant WorkBench testing",
    "sbg:revisionsInfo": [
        {
            "sbg:revision": 0,
            "sbg:modifiedBy": "qqlii44",
            "sbg:modifiedOn": 1705439220,
            "sbg:revisionNotes": ""
        }
    ],
    "sbg:image_url": "https://cavatica.sbgenomics.com/ns/brood/images/yiran/variant-workbench-testing/test1/33.png",
    "sbg:appVersion": [
        "v1.2"
    ],
    "id": "https://cavatica-api.sbgenomics.com/v2/apps/yiran/variant-workbench-testing/test1/33/raw/",
    "sbg:id": "yiran/variant-workbench-testing/test1/33",
    "sbg:revision": 0,
    "sbg:revisionNotes": "",
    "sbg:modifiedOn": 1705439220,
    "sbg:modifiedBy": "qqlii44",
    "sbg:createdOn": 1705439220,
    "sbg:createdBy": "qqlii44",
    "sbg:project": "yiran/variant-workbench-testing",
    "sbg:sbgMaintained": false,
    "sbg:validationErrors": [],
    "sbg:contributors": [
        "qqlii44"
    ],
    "sbg:latestRevision": 0,
    "sbg:publisher": "sbg",
    "sbg:content_hash": "a06fa34bef5a0eaf79fcf72b0aed6ceb39efbb506fb1c76ae164817bd90b547d6",
    "sbg:workflowLanguage": "CWL"
}
