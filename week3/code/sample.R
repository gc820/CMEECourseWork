#!/usr/bin/env Rscript


# File: sample.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script includes functions to calculate the mean of a sample 
#              drawn from a population, using various methods for iteration and 
#              vectorization. These functions demonstrate performance comparisons 
#              between methods such as loops with and without preallocation, 
#              as well as vectorized approaches using `lapply` and `sapply`.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("sample.R")
#   popn <- rnorm(1000)            # Define a population of 1000 random values
#   n <- 30                        # Sample size
#   num <- 50                      # Number of iterations
#   result1 <- loopy_sample1(popn, n, num)  # Without preallocation
#   result2 <- loopy_sample2(popn, n, num)  # With preallocation
#   result4 <- lapply_sample(popn, n, num)  # Using lapply

# Dependencies:
#   Uses base R functions only; no additional packages are required.

############### Functions ################

## A function to tale a sample of size n from a population "popn" and return its mean
myexperiment <- function(popn, n){ # Take sample size n from a population
    pop_sample <- sample(popn, n, replace = FALSE)
    return(mean(pop_sample)) # Return the mean 
}

## Calculate means using a FOR loop on a vector without preallocation: 
loopy_sample1 <- function(popn, n, num) {
    result1 <- vector() #Initialize empty vector of size 1
    for(i in 1:num) {
        result1 <- c(result1, myexperiment(popn, n)) # Append results (non-preallocated)
    }
    return(result1)
}

## Run "num" iterations of the experiment using a FOR loop on a vector with preallocation
loopy_sample2 <- function(popn, n, num) {
    result2 <- vector(, num) # Preallocate expected size
    for(i in 1:num) {
        result2[i] <- myexperiment(popn, n)  # Assign directly to preallocated vector
    }
    return(result2)
}

## Run "num" iterations of the experiment using vectorization with lapply
loopy_sample3 <- function(popn, n, num) {
    result3 <- vector("list", num) # Preallocate expected size
    for(i in 1:num) {
        result3[[i]] <- myexperiment(popn, n) # Assign directly to preallocated list
    }
    return(result3)
}

## Run "num" iterations of the experiment using vectorization with lapply
lapply_sample <- function(popn, n, num) {
    result4 <- lapply(1:num, function(i) myexperiment(popn, n)) # Use lapply for iteration
    return(result4)
}

## Run "num" iterations of the experiment using vectorization with sapply
sapply_sample <- function(popn, n, num) {
    result5 <- lapply(1:num, function(i) myexperiment(popn, n)) # Use sapply for iteration
    return(result5)
}

############### Performance Comparisons (time) ################

# Generate a population for testing
popn <- rnorm(1000)  # Define a population of 1000 random values
n <- 30              # Sample size
num <- 10000         # Number of iterations (large for timing)

# Measure and compare execution times for each method
cat("\n1. Without Preallocation:\n")
time1 <- system.time(loopy_sample1(popn, n, num)) # Without preallocation
print(time1)

cat("\n2. With Preallocation (Vector):\n")
time2 <- system.time(loopy_sample2(popn, n, num)) # With preallocation (vector)
print(time2)

cat("\n3. With Preallocation (List):\n")
time3 <- system.time(loopy_sample3(popn, n, num)) # With preallocation (list)
print(time3)

cat("\n4. Using lapply:\n")
time4 <- system.time(lapply_sample(popn, n, num)) # Using lapply
print(time4)

cat("\n5. Using sapply:\n")
time5 <- system.time(sapply_sample(popn, n, num)) # Using sapply
print(time5)
