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
#   TreeHeight(37, 40)  
# Calculates tree height for a 37° angle and 40m distance

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
    #print(paste("Tree height is:", height))

    return(height) # Returns the calculated height as output 
}

process_tree_heights <- function(filename) { 
    # Get the file path 
    filepath <- file.path("../data", filename) 
    results_filepath <- file.path("../results", "TreeHts.csv")
    
    # Read in the trees.csv file 
    df <- read.csv(filepath)

    # Check for column names 
    if (!all(c("Distance.m", "Angle.degrees") %in% colnames(df))) {
        stop("The dataset must contain columns with distance and degrees columns named 'Distance.m' and 'Angle.degrees'.")
    }

    # Apply the TreeHeight function to each row 
    df$Tree.Height.m <- mapply(TreeHeight, df$Angle.degrees, df$Distance.m)
    
    # Rename columns to match the desired output format 
    names(df)[names(df) == "Angle.degrees"] <- "Angle.degrees"
    names(df)[names(df) == "Distance.m"] <- "Distance.m"

    # Write modified dataframe to results 
    write.csv(df, results_filepath, row.names = FALSE)

    message("Output of Tree Heights saved to ", results_filepath)

}

# Usage of the file 
process_tree_heights("trees.csv")

# Example 
#TreeHeight(37, 40)
