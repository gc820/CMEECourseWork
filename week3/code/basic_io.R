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
#   Uses base R functions only, no additonal packages needed 

# A simple script to illustrate R input-output
# Run line by line and check inputs outputs to understand what is happening 

MyData <- read.csv("../data/trees.csv", header = TRUE) # Import with headers
cat("Data imported successfully.\n\n")

# Save dataset to full csv file 
write.csv(MyData, "../results/MyData.csv") # Write it out as a new file 
cat("Full dataset written to '../results/MyData.csv' without row names.\n\n")

# Append a single row to the same file
write.table(MyData[1, ], file = "../results/MyData.csv", append = TRUE, sep = ",", 
            col.names = FALSE, row.names = FALSE) 
cat("First row of data appended to '../results/MyData.csv'.\n\n")

# Write the full dataset again with row names included
write.csv(MyData, "../results/MyData.csv", row.names = TRUE) # Write row names 
cat("Full dataset written to '../results/MyData_with_row_names.csv' with row names.\n\n")

# Write the full dataset without column names
write.table(MyData, "../results/MyData_no_col_names.csv", sep = ",", col.names = FALSE, 
            row.names = FALSE)

cat("Full dataset written to '../results/MyData_no_col_names.csv' without column names.\n\n")

print("Script complete!")