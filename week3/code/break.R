#!/usr/bin/env Rscript

# File: break.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script demonstrates the use of the `break` statement to exit a `while` loop.
#              It iterates incrementally and exits when a specified condition is met.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("break.R")
#   # The script will print values of `i` from 0 to 9 and then exit the loop when `i` reaches 10.

# Dependencies:
#   Uses base R functions only; no additional packages are required.

# breaking out of loops

# Initalise loop variable 
i <- 0 #Inisitaise i 

# Start inifinte loop 
while (i < Inf) {
    # Check if value of 'i' equals 10 - if so, break
    if (i ==10){
        break
    } else { 
        # If `i` is not 10, print its current value
        cat("i equals ", i, "\n")
        i <- i + 1 # Update i - Increment `i` by 1 for the next iteration
    }
}

# The script exits the loop once `i` reaches 10 and terminates.