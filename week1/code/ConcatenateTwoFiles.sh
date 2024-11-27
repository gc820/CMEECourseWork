#!/bin/sh 
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: ConcatenaateTwoFiles.sh
# Description: Concatenates 2 files together into 1 merged file 
# Arguments: 3
# Date: Oct 2024


if [ "$#" -ne 3 ] ; then 
# Checks if the number of input files is not equal to 3
    echo "Error: You need to provide two input files and one output file."
    return 1
else 
    inputfolder="../data" # Specify the input folder
    outputfolder="../results" # Specify the output folder 
    
    # Specify paths to input files
    inputfile1="$inputfolder/$1"
    inputfile2="$inputfolder/$2"
    outputfile="$outputfolder/$(basename "$3")"

    # Check if input files exist
    if [ ! -f "$inputfile1" ]; then
        echo "Error: Input file '$inputfile1' does not exist."
        return 1
    fi
    
    if [ ! -f "$inputfile2" ]; then
        echo "Error: Input file '$inputfile2' does not exist."
        return 1
    fi
    
    # Concatenate the first file into the output file in the results folder
    cat "$inputfile1" > "$outputfile"

    # Append the second file to the output file in the results folder
    cat "$inputfile2" >> "$outputfile"

    echo "Merged file is located within: $outputfile"

    cat $outputfile 
    return 
fi