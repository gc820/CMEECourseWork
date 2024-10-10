#!/bin/sh 
# Author: Georgina Chow georgina.chow20@imperial.ac.uk 
# Script: csvtospace.sh 
# Description: substitutes commas in files to spaces and creates a new file 
#              Saves the output into a .ssv file 
# Arguments: 1 -> space separated file 
# Date: Oct 2024 

#Find file in data directory 
file="../data/$1"

echo "Creating a space separated version of $file ..."
cat $file | tr -s "," " " >> $file.ssv 
# replaces the character "," with " " in file and saves it as .ssv
echo "Done!" 
exit 

