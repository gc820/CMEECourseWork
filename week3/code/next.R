#!/usr/bin/env Rscript

# File: next.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script demonstrates the use of the `next` statement in a loop. 
#              It prints only odd numbers from 1 to 10 by skipping even numbers.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("next.R")
#   # The script will output only the odd numbers from 1 to 10.

# Dependencies:
#   Uses base R functions only; no additional packages are required.

# Loop with 'next' statement to skipt even numbers 
for (i in 1:10) { 
   if ((i %% 2)== 0) # check if the number is odd 
   next # pass to the next iteration of the loop 
   print(i)
}