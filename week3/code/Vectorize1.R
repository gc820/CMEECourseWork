#!/usr/bin/env Rscript

# File: Vectorize1.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script compares the performance of a loop-based approach versus a 
#              built-in vectorized function for summing all elements in a matrix.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("Vectorize1.R")
#   # The script will automatically generate a 1000x1000 matrix of random numbers,
#   # and measure the execution time for both loop-based and vectorized summing methods.

# Dependencies:
#   Uses base R functions only; no additional packages are required.


M <- matrix(runif(1000000), 1000, 1000)

SumAllElements <- function(M) {
    Dimensions <- dim(M)
    Tot <- 0 
    for (i in 1:Dimensions[1]) {
        for (j in 1:Dimensions[2]) {
            Tot <- Tot + M[i,j]
        }
    }
    return (Tot)
}

print("Using loops, the time taken is:")
print(system.time(SumAllElements(M)))

print("Using the in-built vectorised function, the time taken is:")
print(system.time(sum(M)))