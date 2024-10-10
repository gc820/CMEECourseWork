#!/bin/sh
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: tabtocsv.sh 
# Description: substitute the tabs in the files with commas 
# Saves the output into a .csv file 
# Arguments: 1 -> tb delimited file 
# Date: Oct 2024 

#echo "Creating a comma delimited version of $1 ..." 
#cat $1 | tr -s "\t" "," >> $1.csv 
#echo "Done!"
#exit 

# $1 specifies the first variable/file name of the script 
# tr = translate 
# -s = squeeze replaces the specified chatacter (\t tab in this case)
# with ","
# The output of the tr command is then stored in a new file in the original directory of $1

if [ "$#" -ne 1 ] ; then 
# Checks if the number of input files is not equal to 1
    echo "Error: You need to provide one input file only."
    exit 1
elif [[ "$1" != *.txt ]]; then
# Checks if the input file is a .txt file 
    echo "Error: The input file must be a txt file."
    exit 1
else 
    echo "Creating a comma delimited version of $1 ..." 
    cat $1 | tr -s "\t" "," >> $1.csv 
    # Replaces (translate) the "\t" with "," then creates a new file 
    echo "Done!"
    exit  
fi

