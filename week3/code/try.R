#!/usr/bin/env Rscript

# File: try.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script demonstrates the use of `try` for error handling within 
#              `lapply` and `for` loops. The function attempts to apply `doit` to each
#              element in a sequence of operations and handles errors gracefully.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("try.R")
#   # The script will attempt to run `doit` on each element and catch any errors, 
#   # returning results with error handling.

# Dependencies:
#   This script requires a predefined `doit` function and the variable `popn` 
#   to be defined before running.

# Example error-handling with `lapply` and `for` loop

# Using `lapply` to apply `doit` function and handle errors

result <- lapply(1:15, function(i) try(doit(popn), FALSE))
class(result)
result

result <- vector("list", 15) #Preallocate/Initialize
for(i in 1:15) {
    result[[i]] <- try(doit(popn), FALSE)
    }