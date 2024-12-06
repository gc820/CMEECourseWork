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
#   # The script will try to run `doit` on each element and catch any errors,
#   # returning results with error handling.

# Dependencies:
#   This script requires a predefined `doit` function and the variable `popn`
#   to be defined before running.


## Defining the functions

# `doit` function:
# - Samples a population `x` with replacement.
# - Calculates & prints the mean of the sample if more than 30 unique values.
# - Throws an error if there are too few unique values.
doit <- function(x) {
    temp_x <- sample(x, replace = TRUE)
    if(length(unique(temp_x)) > 30) { # Take mean if sample sufficient diversity
        print(paste("Mean of this sample was:", as.character(mean(temp_x))))
    } else {
        stop("Couldn't calculate mean: too few unique values!")
    }
}

# `trycatch_doit` function:
# - A safer version of `doit` that wraps its execution in a `tryCatch` block.
# - Handles errors and warnings gracefully, returning custom messages.
trycatch_doit <- function(x) {
    tryCatch(
        {
            doit(x) # Attempt the operation/code block to execute
        },
        error = function(e) {
            paste("Error:", conditionMessage(e)) # Errors with custom message
            return(NULL) # Return NULL to indicate failure
        },
        warning = function(w) {
            paste("Warning:", conditionMessage(w)) # Handle warnings if needed
            return(NULL) # Return NULL to indicate failure
        }
    )
}

# Example usage 

# Set seed for repeatability 
set.seed(1345) 

# Define population size of 50 random normal values
popn <- rnorm(50)

# Plot histogram
hist(popn)

# Apply `doit` directly - using `lapply`
lapply(1:15, function(i) doit(popn))

# Apply `doit` with `try` for error handling 
result <- lapply(1:15, function(i) try(doit(popn), silent = TRUE)) 
class(result)  
result
# Silent = T prevents error messages printing in terminal 
# Useful for debugging or suppressing expected errors

# Using a `for` loop with `try`
# Preallocate/Initialize vector list before - to improve efficiency/speec 
result <- vector("list", 15) 
for(i in 1:15) {
    result[[i]] <- try(doit(popn), silent = TRUE)
    }

# Apply `safe_doit` with `tryCatch` using `lapply`
result_tryCatch <- lapply(1:15, function(i) trycatch_doit(popn))
print(result_tryCatch)

# Apply `safe_doit` with `tryCatch` using a `for` loop
result_tryCatch_loop <- vector("list", 15) # Preallocate/Initialize
for (i in 1:15) {
    result_tryCatch_loop[[i]] <- trycatch_doit(popn)
}
print(result_tryCatch_loop)