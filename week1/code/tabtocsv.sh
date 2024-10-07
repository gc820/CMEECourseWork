#!/bin/sh
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: tabtocsv.sh 
# Description: substitute the tabs in the files with commas 
# 
# Saves the output into a .csv file 
# Arguments: 1 -> tb delimited file 
# Date: Oct 2024 

echo "Creating a comma delimited version of $1 ..." 
cat $1 | tr -s "\t" "," >> $1.csv 
echo "Done!"
exit 

# $1 specifies the first variable/file name of the script 
# tr = translate 
# -s = squeeze replaces the specified chatacter (\t tab in this case)
# with ","
# The output of the tr command is then stored in a new file in the original directory of $1
