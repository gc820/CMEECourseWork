#!/usr/bin/env Rscript

# File: TAutoCorr.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Calculates correlation of temperatures between successive years 
#             using permutation tests. Calculates the observed correlation and 
#             generates distribution of shuffled correlations (resampling).
#             Computes approx. p-value to assess significance and creates 
#             histogram for visualisation.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("TAutoCorr.R")

# Dependencies:
#   Requires no additional packages beyond base R.



# Load data and set up environment 
rm(list=ls())
load("../data/KeyWestAnnualMeanTemperature.RData")

# Create vector (n-1) pairs for correlation analysis 
    # Remove 1st element of vector 
successive_temps <- ats$Temp[-1] # temp for yrs 2 to (n)
    # Remove last element of vector 
previous_temps <- ats$Temp[-length(ats$Temp)] # temp for yrs 1 to (n-1)

# Calculate original correlation 
orig_cor <- cor(previous_temps, successive_temps, method="pearson")

# Parameters for the permutation test 
num_simul <- 1000 # Set the resampling number
simul_list <- numeric(num_simul) # Preallocation of empty vector 

set.seed(123) # For reproducibility 

# Use for loop to iterate through the number of temperature simulations
for (i in 1:num_simul) {
    rand_temp <- sample(ats$Temp) # shuffle temps
    simul_list[i] <- cor(rand_temp[-1], rand_temp[-length(rand_temp)], 
    method="pearson")
}

# Calclate approx p-values 
count_greater <- sum(simul_list >= orig_cor) 
# Count correlations greater than original 
approx_p_val <- count_greater/num_simul # Approximate p-value 

# Print the results 
cat("Original correlation: ", orig_cor)
cat("Approx p-value:", approx_p_val)

hist(simul_list, main = "Histogram of Shuffled Correlations",
     xlab = "Correlation Coefficient", breaks = 30, col = "lightblue")
abline(v = orig_cor, col = "red", lwd = 2, lty = 2) # Mark original correlation


# Calculating the ratio of the numer of values above the original correlation
# Checks each value to see if meets condition (TRUE/FALSE)
count_greater <- sum(simul_list >= orig_cor) # Returns number of times TRUE 
# Calculates the ratio/approx., asymptotic p-value 
ratio <- count_greater / length(simul_list)
print(ratio)
