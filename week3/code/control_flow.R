#!/usr/bin/env Rscript

# File: control_flow.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script demonstrates basic control flow using `if` statements in R.
#              It includes examples of conditional checks and outputs messages based 
#              on the value of variables.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("control_flow.R")
#   # The script will evaluate predefined conditions and print results based on them.

# Dependencies:
#   Uses base R functions only; no additional packages are required.


## If statements ##

a <- TRUE 
if (a == TRUE) {
    print("a is TRUE")
} else {
    print("a is FALSE")
}

z <- runif(1) # Generate a uniformly distibuted random number
if (z <= 0.5) {
    print ("Less than a half")
    }