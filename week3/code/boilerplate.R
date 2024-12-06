#!/usr/bin/env Rscript

# File: boilerplate.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: Boilerplate R script that defines a simple function, 
#              `MyFunction`, which accepts two arguments, prints their values
#               and types, and returns them as a vector.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("boilerplate.R")
#   MyFunction(1, 2)
#   MyFunction("Riki", "Tiki")

# Dependencies:
#   Uses base R functions only; no additional packages are required.


# Define a simple function that takes two arguments and prints their types
MyFunction <- function(Arg1, Arg2) {
    # Print the type and value of the first argument
    print(paste("Argument", as.character(Arg1), "is a", class(Arg1)))
    # Example: "Argument 1 is a numeric" or "Argument Riki is a character"

    # Print the type and value of the second argument
    print(paste("Argument", as.character(Arg2), "is a", class(Arg2)))
    # Example: "Argument 2 is a numeric" or "Argument Tiki is a character"

    # Return both arguments as a vector
    return(c(Arg1, Arg2)) # (optional, but very useful)
    # This allows reuse of combined values programmatically
}

# Test the function with numeric arguments
cat("\nTesting with numeric arguments:\n")
result1 <- MyFunction(1, 2) 
cat("Returned vector:\n")
print(result1) 

# Test the function with character arguments
cat("\nTesting with character arguments:\n")
result2 <- MyFunction("Riki", "Tiki")
cat("Returned vector:\n")
print(result2)