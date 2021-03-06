#!/bin/env bash
############################################################################
##
##
## Author: Joe Colgan                      Name: get_lowest_exon_p_value.sh
##
##
## Date: 2018/06/01
##
## Purpose:
## This script takes input and output from the command line. 
## The input is a tab-delimited text file generated by the software programme,
## DEXSEq. 
## The script parses field containing information on gene name and p-value.
## The script sorts the parsed data based on lowest values in the second field (p-value).
## It then searches the sorted data using the first field (gene name) and extracts
## the first incident of each gene (i.e. extracts gene name and lowest p-value). 
## The script outputs a tab-delimited text file containing two columns:
## Column 1: locus
## Column 2: adjusted_pvalue
## The output of the script can be loaded into the R script 
##
#############################################################################

## Take input from the command line:
input=$1
output=$2

## Check arguments exist:
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "usage: ./get_lowest_exon_p_value.sh input output"
    exit -1
fi

##========================================================================
## Step One: Extract fields of interest:
##========================================================================

## Print to console:
echo "step one: extracting fields of interest"

## Extract fields of interest:
cut -f 1,2 "$input" | tail -n +2 - | sort -k2,2n - > "$input".tmp
 
## Extract unique gene list:
echo 'extracting unique gene list'
cut -f 1 "$input".tmp | sort | uniq - > "$input".gene_list.tmp

## Loop and extract lowest p-value per gene: 
while read line ; 
do 
grep "$line" "$input".tmp | head -n 1 - >> "$output".tmp; 
done < "$input".gene_list.tmp

echo 'lowest p-value per gene extraction - completion'
## Add header information applicable for topGO Rscript:
echo "locus" "raw_pvalue" | \
 sed 's/ /\t/g' - | \
 cat - "$output".tmp > "$output"

## Remove any spurious inverted commas present within the dataset:  
sed -i 's/"//g' "$output"
grep -v 'XM_' "$output" > "$output".tmp
mv "$output".tmp "$output"

## Remove temporary files:
rm *.tmp

## Print to console:
echo "step one: extracting"
