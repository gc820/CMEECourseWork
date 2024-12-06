#!/usr/bin/env Rscript

# File: preallocate.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: Script compares performance of vector concatenation with
#              and without preallocation. Includes 2 functions: `NoPreallocFun`
#              and `PreallocFun`, to demonstrate differences in execution time.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("preallocate.R")
#   NoPreallocFun(1000)   
# Runs the function without preallocation
#   PreallocFun(1000)     
# Runs the function with preallocation

# Dependencies:
#   Uses base R functions only; no additional packages are required.

### Pre-allocation ###
# **Without Preallocation**:
#   - Uses vector concatenation (`c(a, i)`) - computationally exhaustive
#   - Every iteration, memory is reallocated to accommodate the growing vector.
#   - Expected to be slower for larger `x` values.
#
# **With Preallocation**:
#   - Initializes vector of required size using `rep(NA, x)` before the loop.
#   - Assigns values to preallocations (avoids repeat memory allocations)
#   - Expected to be significantly faster for larger `x` values.


# Function without preallocation 
NoPreallocFun <- function(x) {
    a <- vector() # Initialise empty vector 
    for (i in 1:x) {
        a <- c(a, i) # Concatenate `i` to vector 
    }
    return(a)
}

# Measure the time taken by the no preallocation function 
print(system.time(NoPreallocFun(1000)))


# Function with preallocation 
PreallocFun <- function(x) {
    a <- rep(NA, x) # Pre-allocated vector (size x)
    for (i in 1:x) {
        a[i] <- i # Assign `i` to the `i`th position
    }
    return(a)
}

# Measure time taken by PreallocFun
print(system.time(PreallocFun(1000)))