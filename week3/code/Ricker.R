#!/usr/bin/env Rscript

# File: Ricker.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script runs a simulation of the Ricker model, a simple population 
#              dynamics model, over a specified number of generations. It calculates 
#              population size at each generation and returns a vector of these values.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("Ricker.R")
#   result <- Ricker(N0 = 1, r = 1, K = 10, generations = 50)  # Runs the Ricker model
#   plot(result, type = 'l')                                   # Plots the population over time

# Dependencies:
#   Uses base R functions only; no additional packages are required.

# Define the Ricker function
Ricker <- function(N0=1, r=1, K=10, generations=50)
{ 
    # Runs a simulation of the Ricker model 
    # Returns a vector of length generations 

    N <- rep(NA, generations)  # Creates a vector of NA
    
    N[1] <- N0
    for (t in 2:generations)
    {
        N[t] <- N[t-1] * exp(r*(1.0-(N[t-1]/K)))
    }
    return(N)
}

plot(Ricker(generations=10), type='l')