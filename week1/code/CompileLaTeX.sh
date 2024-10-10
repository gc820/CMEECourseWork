#!/bin/sh
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: Compile.LaTeX.sh
# Desc: Compiles latex with bibtex to produce a .pdf file that has 
#       formatted citations. 
#       Removes and cleans up intermediate files. 
# Arguments: 1  
# Date: Oct 2024

pdflatex $1.tex
bibtex $1 
pdflatex $1.tex
pdflatex $1.tex
evince $1.pdf & 

## Cleanup rm *.aux
rm *.aux 
rm *.log
rm *.bbl 
rm *.blg  
