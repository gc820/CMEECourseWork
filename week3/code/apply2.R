#!/usr/bin/env Rscript

# File: apply2.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script demonstrates the use of the `apply` function in R to perform 
#              operations on rows of a matrix. It applies a custom function, `SomeOperation`, 
#              which multiplies each row by 100 if the sum of its elements is positive.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("apply2.R")
#   # The script will create a 10x10 matrix of random values, apply `SomeOperation` to each row, 
#   # and print the resulting matrix.

# Dependencies:
#   Uses base R functions only; no additional packages are required.

# Define a custom operation to apply to each row

SomeOperation <- function(v) { # Takses v as input 
    if (sum(v) > 0) { # If sum of v is >0 (both + and -)
        return (v * 100) # Multiply by 100 
    } else {
        return (v) 
    }
}

M <- matrix(rnorm(100), 10, 10)
print (apply(M, 1, SomeOperation))