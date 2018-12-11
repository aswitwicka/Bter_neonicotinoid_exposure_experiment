## Introduction

The current repository contains all scripts used for the differential expression analysis of _Bombus terrestris_ castes in response to neonicotinoid exposure as reported in:  
Colgan, T.J., Fletcher, I.K., Arce, A.N., Gill, R.J., Ramos Rodrigues, A., Stolle, E., Chittka, L. and Wurm, Y.  
Caste- and pesticide-specific effects of neonicotinoid pesticide exposure on gene expression in bumblebees.   

Current workflow consists of:  
1. Pseudoalignment and transcript quantification using kallisto.   
2. Splice-aware alignment using HISAT2.  
3. Exon-level read count generation using HTSeq.  
4. Differential expression analysis using DESeq2.  
5. Differential exon usage analysis using DEXSeq.   
6. Gene Ontology enrichment analysis using topGO. 
7. Comparative analysis of read counts generated by kallisto and HTSeq.  
8. Generation of graphics for visualisation of results.  

```
01_amplitude_kallisto_quantifications/
|- run_kallisto.sh
02_splice_aware_alignments/
|- hisat_mapping.sh
03_exon_level_read_count_quantification/
|- 
04_differential_expression_analysis/
05_differential_exon_usage_analysis/
06_gene_ontology_enrichment_analysis/
07_comparative_read_count_analysis/
08_visualisation_of_graphics/

```
