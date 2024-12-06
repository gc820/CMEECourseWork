#!/usr/bin/env Rscript

# File: browse.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: Script simulates exponential growth using basic growth model and
#              demonstrates use of the `browser()` function for debugging.
#              Also includes a plot of the growth over generations.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("browse.R")
#   Exponential()  
# Runs the exponential growth model and enters the debugger at each generation
#   plot(Exponential(), type = "l", main = "Exponential growth")
# Plots the growth model output

# Dependencies:
#   Uses base R functions only; no additional packages are required.

### Debugging and `browser()` ### 
# - `browser()` function pauses execution & provides environment for debugging.
#       Use  to inspect variables & debug code inside loops or functions.
#       Avoid leaving `browser()` in production code; 
#       instead, use it only during development.
# - Or move scripts with `browser()` to a dedicated sandbox or debug directory.



# Exponential growth function with debugging
Exponential <- function(N0 = 1, r = 1, generations = 10) {
    # Simulates exponential growth over `generations`.
    # Returns: a vector of length generations 

    N <- rep(NA, generations) # Preallocate a vector to store population sizes

    N[1] <- N0 # Set inital population size 
    
    for (t in 2:generations) {
        N[t] <- N[t-1] * exp(r) # Calculate population for generation `t`
        #browser()
    }

    return(N) # Return the vector of population sizes
}


# Example Usage:
# Generate and plot the results of the Exponential function
result <- Exponential() # Runs the model and pauses at each step
plot(result, type = "l", main = "Exponential Growth", 
    xlab = "Generation", ylab = "Population Size")
