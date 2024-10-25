#!/usr/bin/env Rscript

# File: basic_io.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script demonstrates basic input-output operations in R. 
#              It reads data from a CSV file and writes it in various formats 
#              to an output file, showcasing options for headers, row names, 
#              and appending data.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("basic_io.R")
#   # The script will read `trees.csv` and save variations of this data to `../results/MyData.csv`.

# Dependencies:
#   Uses base R funct

# A simple script to illustrate R input-output
# Run line by line and check inputs outputs to understand what is happening 

MyData <- read.csv("../data/trees.csv", header=TRUE) # import with headers

write.csv(MyData, "../results/MyData.csv") # Write it out as a new file 

write.table(MyData[1,], file = "../results/MyData.csv", append=TRUE) # Append to it 

write.csv(MyData, "../results/MyData.csv", row.names=TRUE) # Write row names 

write.table(MyData, "../results/MyData.csv", col.names = FALSE) # ignore column names 

print("Script complete!")