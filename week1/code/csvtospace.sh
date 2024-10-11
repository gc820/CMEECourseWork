#!/bin/sh 
# Author: Georgina Chow georgina.chow20@imperial.ac.uk 
# Script: csvtospace.sh 
# Description: substitutes commas in files to spaces and creates a new file 
#              Saves the output into a .ssv file 
# Arguments: 1 -> space separated file 
# Date: Oct 2024 

#Find file in data directory 
file="$1"
outputfolder="../results"

if [ "$#" -ne 1 ] ; then 
# Checks if the number of input files is not equal to 1
    echo "Error: You need to provide one input file only."
    exit 1
else 
    # Check the input file exists 
    if [ ! -f "$file" ]; then 
        echo "Error: the file $file does not exist."
        exit 1 
    fi 

    filename=$(basename "$file")
    # Extracts the filename from the path (to use in results folder)
    echo "Creating a space separated version of $file ..."
    tr -s "," " " < "$file" > "$outputfolder/${filename}.ssv"  
    # Replaces (translates) the "," with " " then creates a new file 
    # < "$file" redirects input from a file to the tr command 
    # > redirects the output from tr to a new file inside the output folder
    echo "Done!"
    exit  
fi
