#!/bin/sh
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: Compile.LaTeX.sh
# Desc: Compiles latex with bibtex to produce a .pdf file that has 
#       formatted citations. 
#       Removes and cleans up intermediate files. 
# Arguments: 1  
# Date: Oct 2024

# Check if a LaTeX file name is provided
if [ "$#" -ne 1 ]; then
    echo "Error: You need to provide a LaTeX file without the .tex extension."
    exit 1
fi

filename="$1"

# Compile the LaTeX file and handle errors
echo "Compiling LaTeX file $filename.tex..."

pdflatex $1.tex  # Generates 2 incomplete files 

if ! pdflatex "$filename.tex"; then
    echo "Error: pdflatex failed during the initial compilation."
    exit 1
fi

# Format bibliography and handle errors
bibtex $1  # Partially formats the bibliography, generates 2 more files 

if ! bibtex "$filename"; then
    echo "Error: bibtex failed to process the bibliography."
    exit 1
fi

# Second compilation
pdflatex $1.tex  # Updates the .aux and .log files 

if ! pdflatex "$filename.tex"; then
    echo "Error: pdflatex failed during the second compilation."
    exit 1
fi

# Final compilation
pdflatex $1.tex  # Runs and updates the final .log and .aux files to produce the final pdf 

if ! pdflatex "$filename.tex"; then
    echo "Error: pdflatex failed during the final compilation."
    exit 1
fi

# Open the generated PDF
evince $1.pdf &  # Opens the pdf created 

evince "$filename.pdf" &>/dev/null &  # Redirect all output of the command to /dev/null (discard)
if [ $? -ne 0 ]; then   # & - runs command in background to allow script to continue 
    echo "Warning: Could not open $filename.pdf. Please open it manually."
fi

## Cleanup rm *.aux (auxillary files)
echo "Cleaning up auxiliary files..."

rm -f *.aux 
rm -f *.log 
rm -f *.bbl 
rm -f *.blg  

echo "LaTeX compilation completed successfully. Output: $filename.pdf"
exit 0 