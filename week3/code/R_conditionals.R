#!/usr/bin/env Rscript

# File: R_conditionals.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script includes functions that use conditionals to evaluate properties 
#              of numbers, such as whether they are even, powers of 2, or prime numbers.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("R_conditionals.R")
#   is.even(6)         # Checks if 6 is even
#   is.power2(4)       # Checks if 4 is a power of 2
#   is.prime(3)        # Checks if 3 is a prime number

# Dependencies:
#   Uses base R functions only; no additional packages are required.

##Functions with conditionals## 

# Checks if an integer is even 
is.even <- function(n = 2) {
    if (n %% 2 == 0) {
        return(paste(n, 'is even!'))
    } else {
    return(paste(n, 'is odd!'))
    }
}

is.even(6)

# Checks if a number is a power of 2 
is.power2 <- function(n=2) {
    if (log2(n) %% 1==0) {
        return(paste(n, 'is a power of 2!'))
    } else {
    return(paste(n, 'is not a power of 2!'))
        }
}

is.power2(4)

# Checks if a number is prime 
is.prime <- function(n) {
    if(n==0) {
        return(paste(n, 'is a zero!'))
    } else if (n==1) {
        return(paste(n, 'is just a unit!'))
    }

    ints <- 2:(n-1)

    if (all(n%%ints!=0)) {
        return(paste(n, 'is a prime!'))
    } else {
    return(paste(n, 'is a composite!'))
    }
}

is.prime(3)
