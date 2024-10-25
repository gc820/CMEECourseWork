#!/usr/bin/env Rscript

# File: boilerplate.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This is a boilerplate R script that defines a simple function, `MyFunction`,
#              which accepts two arguments, prints their values and types, and returns them as a vector.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("boilerplate.R")
#   MyFunction(1, 2)             # Test with numeric arguments
#   MyFunction("Riki", "Tiki")    # Test with character arguments

# Dependencies:
#   Uses base R functions only; no additional packages are required.


# A boilerplate R script 

MyFunction <- function(Arg1, Arg2) {

    # Statements involving Arg1, Arg2 
    print(paste("Argument", as.character(Arg1), "is a", class(Arg1))) # print Arg1 type
    print(paste("Argument", as.character(Arg2), "is a", class(Arg2))) # print Arg1 type

    return(c(Arg1, Arg2)) # (optional, but very useful)
}

MyFunction(1,2) # test the function
MyFunction("Riki", "Tiki") # A different test 