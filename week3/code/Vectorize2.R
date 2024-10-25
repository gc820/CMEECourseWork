#!/usr/bin/env Rscript

# File: Vectorize2.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script simulates population dynamics using the stochastic Ricker 
#              equation with Gaussian fluctuations. It includes both a non-vectorized
#              version and a vectorized version to improve performance.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("Vectorize2.R")
#   result <- stochrick()              # Runs the non-vectorized version

# Dependencies: 
#   Uses base R functions only; no additional packages are required.


# Runs the stochastic Ricker equation with gaussian fluctuations
rm(list = ls())

stochrick <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2,numyears = 100){

  N <- matrix(NA, numyears, length(p0))  #initialize empty matrix

  N[1, ] <- p0

  for (pop in 1:length(p0)) { #loop through the populations

    for (yr in 2:numyears){ #for each pop, loop through the years

      N[yr, pop] <- N[yr-1, pop] * exp(r * (1 - N[yr - 1, pop] / K) + rnorm(1, 0, sigma)) # add one fluctuation from normal distribution
    
     }
  
  }
 return(N)

}

# Now write another function called stochrickvect that vectorizes the above to
# the extent possible, with improved performance: 

#print("Vectorized Stochastic Ricker takes:")
#print(system.time(res2<-stochrickvect()))