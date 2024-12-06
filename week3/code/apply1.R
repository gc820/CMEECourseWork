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

# Generate a 10x10 matrix of random numbers from a normal distribution
M <- matrix(rnorm(100), nrow = 10, ncol = 10)

# Calculate the mean of each row
RowMeans <- apply(M, 1, mean)
print(RowMeans)

# Calculate the variance of each row
RowVars <- apply(M, 1, var)
print(RowVars)

# Calculate the mean of each column
ColMeans <- apply(M, 2, mean)
print(ColMeans)

## Output explanations ## 

# M: A 10x10 matrix of random numbers generated using rnorm().
# apply(M, 1, mean): Computes the mean for each row (dimension 1 of the matrix).
# apply(M, 1, var): Computes the variance for each row.
# apply(M, 2, mean): Computes the mean for each column (dimension 2 of the matrix).

# Outputs are displayed for:
# - RowMeans: A vector of row means, where each element corresponds to the mean of a row in M.
# - RowVars: A vector of row variances, where each element corresponds to the variance of a row in M.
# - ColMeans: A vector of column means, where each element corresponds to the mean of a column in M.
