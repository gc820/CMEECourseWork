#!/usr/bin/env Rscript

# File: preallocate.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script compares the performance of vector concatenation with 
#              and without preallocation. It includes two functions: `NoPreallocFun` 
#              and `PreallocFun`, which demonstrate the difference in execution time.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("preallocate.R")
#   NoPreallocFun(1000)   # Runs the function without preallocation
#   PreallocFun(1000)     # Runs the function with preallocation

# Dependencies:
#   Uses base R functions only; no additional packages are required.

## Pre-allocation ##

NoPreallocFun <- function(x) {
    a <- vector() # empty vector 
    for (i in 1:x) {
        a <- c(a, i) # concatenate 
    }
}

print(system.time(NoPreallocFun(1000)))

PreallocFun <- function(x) {
    a <- rep(NA, x) # Pre-allocated vector 
    for (i in 1:x) {
        a[i] <- i # assign 
    }
}

print(system.time(PreallocFun(1000)))