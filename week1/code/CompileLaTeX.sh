#!/bin/sh
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: Compile.LaTeX.sh
# Desc: Compiles latex with bibtex to produce a .pdf file that has 
#       formatted citations. 
#       Removes and cleans up intermediate files. 
# Arguments: 1  
# Date: Oct 2024

pdflatex $1.tex  # Generates 2 incomplete files 
bibtex $1  # Partially formats the bibliography, generates 2 more files 
pdflatex $1.tex  # Updates the .aux and .log files 
pdflatex $1.tex  # Runs and updates the final .log and .aux files to produce the final pdf 
evince $1.pdf &  # Opens the pdf created 

## Cleanup rm *.aux
rm *.aux 
rm *.log
rm *.bbl 
rm *.blg  
