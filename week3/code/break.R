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
i <- 0 #Inisitaise i 
    while (i < Inf) {
        if (i ==10){
            break
        } else { # breal out fo the while loop!
            cat("i equals ", i, "\n")
            i <- i + 1 # Update i 
        }
    }