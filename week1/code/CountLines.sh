#!/bin/sh
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: CountLines.sh
# Description: Counts the number of lines in a file  
# Arguments: 1
# Date: Oct 2024

file="../data/$1"

if [ "$#" -ne 1 ] ; then 
# Checks if the number of input files is not equal to 1
    echo "Error: You need to provide one input file only."
    exit 1
else 
    echo "File: $file"
    NumLines=$(wc -l < "$file")
    echo "Line count: $NumLines"
    echo "The file $file has $NumLines lines"  

fi

# Can also be written as NumLines=$(wc -l < $1)
# < is required to specify the contents of the file to the standard input 
# and to prevent the file name from also being printed 