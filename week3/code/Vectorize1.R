#!/usr/bin/env Rscript

# File: Vectorize1.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: Script compares performance of a loop-based approach versus a 
#              built-in vectorized function for summing elements in a matrix.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("Vectorize1.R")
#   The script will automatically generate a 1000x1000 matrix of random numbers,
#   and measure the execution time for both loop-based and vectorized summing methods.

# Dependencies:
#   Uses base R functions only; no additional packages are required.

# Create a matrix with randomised values 
M <- matrix(runif(1000000), 1000, 1000)

# Create a function to sum all elements useing a nested loop 
SumAllElements <- function(M) {
    dimensions <- dim(M) # Get matrix dimensions 
    Tot <- 0 # Initialise total sum variable 

    # Iterate over rows and columns to sum the elements 
    for (i in 1:dimensions[1]) {
        for (j in 1:dimensions[2]) {
            Tot <- Tot + M[i,j]
        }
    }
    return (Tot)
}

# Measure the exection time 
print("Using loops, the time taken is:")
print(system.time(SumAllElements(M)))

# Use R's built in sum() function
print("Using the in-built vectorised function, the time taken is:")
print(system.time(sum(M)))