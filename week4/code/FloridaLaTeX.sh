#!/usr/bin/bash
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Desc: Compile Florida Practical Report Written in LaTex

Rscript Florida.R     # Run Rscript to produce plots
pdflatex Florida.tex    # Compile file 
pdflatex Florida.tex

## Cleanup 
rm *.aux
rm *.log

mv "Florida.pdf" ../results   # move the report to results directory