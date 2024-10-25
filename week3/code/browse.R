#!/usr/bin/env Rscript

# File: browse.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script simulates exponential growth using a basic growth model and 
#              demonstrates the use of the `browser()` function for debugging purposes.
#              It includes a plot of the growth over generations.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("browse.R")
#   Exponential()  # Runs the exponential growth model and enters the debugger at each generation
#   plot(Exponential(), type = "l", main = "Exponential growth")  # Plots the growth model output

# Dependencies:
#   Uses base R functions only; no additional packages are required.

# Exponential growth function with debugging
Exponential <- function(N0 = 1, r = 1, generations = 10) {
    # Runs a simulations of eponential growth
    # Returns a vector of length generations 

    N <- rep(NA, generations) # Creates a vector of NA 

    N[1] <- N0 
    for (t in 2:generations) {
        N[t] <- N[t-1] * exp(r)
        browser()
    }
    return(N)
}

plot(Exponential(), type="l", main="Exponential growth")