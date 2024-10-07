#!/bin/bash 

echo "File: $1"
NumLines=`wc -l < $1`
echo "Line count: $NumLines"
echo "The file $1 has $NumLines lines" 
echo 

# Can also be written as NumLines=$(wc -l < $1)
# < is required to specify the contents of the file to the standard input 
# and to prevent the file name from also being printed 
