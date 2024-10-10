#!/bin/sh
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Script: tiff2png.sh
# Description: Converts a .tiff to a .png file  
# Arguments: 1
# Date: Oct 2024

for f in *.tif; 
    do 
        echo "Converting $f"; 
        convert "$f" "$(basename "$f" .tif).png"; 
    done 
    