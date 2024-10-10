#!/bin/sh 
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: ConcatenaateTwoFiles.sh
# Description: Concatenates 2 files together into 1 merged file 
# Arguments: 3
# Date: Oct 2024

#cat $1 > $3 
#cat $2 >> $3 
#echo "Merged File is" 
#cat $3 

if [ "$#" -ne 3 ] ; then 
# Checks if the number of input files is not equal to 3
    echo "Error: You need to provide two input files and one output file."
    exit 1
else 
    cat $1 > $3 
    # Writes a new $3 file with the contents from the $1 file
    cat $2 >> $3 
    # Appends the input of $2 file to $3 file (merges)
    echo "Merged File is" 
    cat $3 
    # Prints the output of $3 file to the terminal 
    exit 
fi