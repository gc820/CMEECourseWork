#!/usr/bin/env Rscript

# File: apply1.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script demonstrates the use of the `apply` function in R to calculate 
#              the mean and variance of rows and the mean of columns in a matrix.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("apply1.R")
#   # The script will generate a 10x10 matrix of random numbers, calculate the row means, 
#   # row variances, and column means, and print the results.

# Dependencies:
#   Uses base R functions only; no additional packages are required.

## Build a random matrix 
M <- matrix(rnorm(100), 10, 10)

## Take the mean of each row 
RowMeans <- apply(M, 1, mean)
print(RowMeans)

## Now the variance 
RowVars <- apply(M, 1, var)
print(RowVars)

## By column 
ColMeans <- apply(M, 2, mean)
print(ColMeans)

