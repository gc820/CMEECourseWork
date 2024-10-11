#!/bin/sh
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: tabtocsv.sh 
# Description: substitute the tabs in the files with commas 
# Saves the output into a .csv file 
# Arguments: 1 -> tb delimited file 
# Date: Oct 2024 

# $1 specifies the first variable/file name of the script 
# tr = translate 
# -s = squeeze replaces the specified chatacter (\t tab in this case)
# with ","
# The output of the tr command is then stored in a new file in the original directory of $1

#Find file in data directory 
file="$1"
outputfolder="../results"

if [ "$#" -ne 1 ] ; then 
# Checks if the number of input files is not equal to 1
    echo "Error: You need to provide one input file only."
    exit 1
else 
    filename=$(basename "$file")
    # Extracts the filename from the path (to use in results folder)
    echo "Creating a comma delimited version of $1 ..." 
    tr -s "\t" "," < "$file" > "$outputfolder/${filename}.csv"
    # Replaces (translate) the "\t" with "," then creates a new file 
    # < "$file" redirects input from a file to the tr command 
    # > redirects the output from tr to a new file inside the output folder
    echo "Done!"
    exit  
fi

 