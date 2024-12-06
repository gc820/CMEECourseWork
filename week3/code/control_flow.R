#!/usr/bin/env Rscript

# File: control_flow.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: The script demonstrates basic control flow using `if` statements.
#              It includes conditional check examples & outputs messages based 
#              on the value of variables.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("control_flow.R")
#   # The script will evaluate predefined conditions and print results

# Dependencies:
#   Uses base R functions only; no additional packages are required.


# - `if`: Executes a block of code if a condition is TRUE.
# - `else`: Executes a block of code if the `if` condition is FALSE.
# - `runif`: Generates random numbers (used here to simulate dynamic conditions)


## If statements ##

# Check if a variable `a` is TRUE or FALSE and print the corresponding message.
a <- TRUE 
if (a == TRUE) { # If `a` is TRUE, run this block
    print("a is TRUE")
} else { # If `a` is FALSE, run this block
    print("a is FALSE")
}

# Generate random number `z` and print a message if less than or equal to 0.5.
z <- runif(1) # Generate a uniformly distibuted random number between 0 to 1
if (z <= 0.5) {  # If `z` is less than or equal to 0.5, run this block
    print ("Less than a half")
}