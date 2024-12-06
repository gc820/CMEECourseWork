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
    if (is.na(n)) {
        return('Input is NA!') # Handle NA values
    }
    if (!is.numeric(n) || n %% 1 != 0) {
        return('Input must be an integer!') # Ensure the input is an integer
    }
    if (n %% 2 == 0) {
        return(paste(n, 'is even!')) # Even case
    } else {
        return(paste(n, 'is odd!')) # Odd case
    }
}

# Examples 
is.even(6)
is.even(NA)
is.even(2.5)

# Checks if a number is a power of 2 
is.power2 <- function(n = 2) {
    if (is.na(n)) {
        return('Input is NA!') # Handle NA values
    }
    if (n <= 0 || !is.numeric(n) || n %% 1 != 0) {
        return('Input must be a positive integer!') # Ensure the input is a positive integer
    }
    if (log2(n) %% 1 == 0) {
        return(paste(n, 'is a power of 2!')) # Power of 2 case
    } else {
        return(paste(n, 'is not a power of 2!')) # Not a power of 2 case
    }
}

# Examples
is.power2(4)
is.power2(3)
is.power2(-4)

# Checks if a number is prime 
is.prime <- function(n) {
    if (is.na(n)) {
        return('Input is NA!') # Handle NA values
    }
    if (!is.numeric(n) || n %% 1 != 0) {
        return('Input must be an integer!') # Ensure the input is an integer
    }
    if (n <= 0) {
        return(paste(n, 'is not valid for primality testing!')) # Handle non-positive numbers
    }
    if (n == 1) {
        return(paste(n, 'is just a unit!')) # Special case for 1
    }
    ints <- 2:(n - 1) # Range of possible divisors
    if (all(n %% ints != 0)) {
        return(paste(n, 'is a prime!')) # Prime case
    } else {
        return(paste(n, 'is a composite!')) # Composite case
    }
}

# Examples 
is.prime(3)
is.prime(1)
is.prime(0)
is.prime(10.5)