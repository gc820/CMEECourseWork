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
    return(mean(pop_sample)) # return the mean 
}

## Calculate means using a FOR loop on a vector without preallocation: 
loopy_sample1 <- function(popn, n, num) {
    result1 <- vector() #Initialize empty vector of size 1
    for(i in 1:num) {
        result1 <- c(result1, myexperiment(popn, n))
    }
    return(result1)
}

## To run "num" iterations of the experiment using a FOR loop on a vector with preallocation: 
loopy_sample2 <- function(popn, n, num) {
    result2 <- vector(, num) # Preallocate expected size
    for(i in 1:num) {
        result2[i] <- myexperiment(popn, n)
    }
    return(result2)
}

## To run "num" iterations of the experiment using a FOR loop on a list with preallocation: 
loopy_sample3 <- function(popn, n, num) {
    result3 <- vector("list", num) # Preallocate expected size
    for(i in 1:num) {
        result3[[i]] <- myexperiment(popn, n)
    }
    return(result3)
}

## To run "num" iterations of the experiment using vectorization with lapply:
lapply_sample <- function(popn, n, num) {
    result4 <- lapply(1:num, function(i) myexperiment(popn, n))
    return(result4)
}

## To run "num" iterations of the experiment using vectorization with sapply: 
sapply_sample <- function(popn, n, num) {
    result5 <- lapply(1:num, function(i) myexperiment(popn, n))
    return(result5)
}