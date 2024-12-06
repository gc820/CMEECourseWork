#!/bin/sh
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: tiff2png.sh
# Description: Converts .tiff to .png files  
# Arguments: 1
# Date: Oct 2024

# Original basic script 

#for f in *.tif; 
#    do 
#        echo "Converting $f"; 
#        convert "$f" "$(basename "$f" .tif).png"; 
#    done 


# Improved script 

inputfolder="../data"
outputfolder="../results"

# Check if 'convert' utility available from ImageMagick
if ! command -v convert &>/dev/null; then # Check is command 'convert' is available in system PATH 
    echo "Error: 'convert' utility (ImageMagick) not installed or not available in system PATH. Please install to run this script."
    exit 1
fi 

# Modifies how bash handles the filename expansion (globbing)
# shopt = shell options; -s = set; 
# nullglob = allows filename patterns that don't match to expand to a null string 
#            rather than a literal string
shopt -s nullglob # Prevents loop running if no files match
# Collects all tiff files from the input folder to put into an array 
tiff_files=("$inputfolder"/*.tiff "$inputfolder"/*.tif)

if [ ${#tiff_files[@]} -eq 0 ]; then 
    echo "Error: No .tiff or .tif files found in $inputfolder."
    exit 1 
fi
# Checks if the tiff_files array is empty 
# ie. if 0 then there are no tiff files in the folder  
    
for f in "${tiff_files[@]}"; do 
# Iterates of each file in the tiff_array 
        echo "Converting $f to PNG format"
        convert "$f" "$outputfolder/$(basename "${f%.*}").png"; 
        # Generates the output filename 
        # $(basename "${f%.*}").png - extracts the base filename from full file path 
        # without the file extension & appends .png to the base filename
    done 

echo "All conversions complete, see the $outputfolder folder."
exit 0 