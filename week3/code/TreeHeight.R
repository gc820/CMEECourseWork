#!/usr/bin/env Rscript

# File: TreeHeight.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script calculates the height of a tree given the distance 
#              from its base and the angle of elevation to its top, using 
#              trigonometry. The function `TreeHeight` takes angle and distance 
#              as arguments and returns the calculated tree height.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("TreeHeight.R")
#   TreeHeight(37, 40)  # Calculates tree height for a 37° angle and 40m distance

# Dependencies:
#   Uses base R functions only; no additional packages are required.


# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees: The angle of elevation of tree
# distance: The distance from base of tree (e.g., meters) 
#
# OUTPUT
# The heights of the tree, same units as "distance"

# Define the TreeHeight function
TreeHeight <- function(degrees, distance) { 
    radians <- degrees * pi / 180 # Converts degrees to radians
    height <- distance * tan(radians) # Calculates the height using tangent function
    print(paste("Tree height is:", height))

    return(height) # Returns the calculated height as output 
}

# Example 
TreeHeight(37, 40)