## What is this?

This repository contains all scripts used for the differential expression analysis of _Bombus terrestris_ castes in response to neonicotinoid exposure as reported in:  
Colgan, T.J., Fletcher, I.K., Arce, A.N., Gill, R.J., Ramos Rodrigues, A., Stolle, E., Chittka, L. and Wurm, Y.  
Caste- and pesticide-specific effects of neonicotinoid pesticide exposure on gene expression in bumblebees.   

## License

This work is distributed under the GPLv3 license. The reuse of code derived from this repository thus requires two things:
1) Proper attribution (i.e., citation of the associated publication).
2) Publication of reused scripts on an open-access platform, such as Github.  

## Workflow

Analysis workflow consisted of:  
1. Pseudoalignment and transcript quantification using kallisto.   
2. Splice-aware alignment using HISAT2.  
3. Exon-level read count generation using HTSeq.  
4. Differential expression analysis using DESeq2.  
5. Differential exon usage analysis using DEXSeq.   
6. Gene Ontology enrichment analysis using topGO. 
7. Comparative analysis of read counts generated by kallisto and HTSeq.  
8. Generation of graphics for visualisation of results.  

### Repository contents:  
```
01_multiqc_quality_assessment
|- hisat2_to_multiQC.sh
02_amplitude_kallisto_quantifications/
|- run_kallisto.sh
03_spliced_mapping_hisat
|- hisat_mapping.sh
04_exon_level_read_count_quantifications
|- prepare_input_files_for_dexseq.sh
05_differential_expression_analysis
|- input
|- |- room_batch_information_per_sample-clean.combined.reordered.txt
|- treatment_caste_interaction_analysis
|- |- gene_level_3treatments.Rmd
|- treatment_specific_analysis
|- |- gene_level_3_treatments.Rmd
06_differential_exon_usage_analysis
|- dexseq_analysis.Rmd
|- get_lowest_exon_p_value.sh
07_gene_ontology_enrichment_analysis
|- go_enrichment_analysis.Rmd
|- input
|- |- dmel_vs_bter_biomart.input_for_converter.output.txt
08_comparative_read_count_analysis
|- compare_kallisto_hisat2_quants.Rmd
09_plot_visualisation
|- euler_diagram.Rmd
|- plot_DEGs_heatmap.Rmd
|- plot_go_barchart.Rmd
utility
|- barchart_helper_functions.R
|- description_from_LOCid.R
|- helper_functions_for_heatmaps.R
```
