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


# `TreeHeight` function:
# - Calculates the height of a tree using the trigonometric formula:
#   height = distance * tan(radians)
# - Arguments:
#   - `degrees`: The angle of elevation in degrees.
#   - `distance`: Distance to the tree base in the same units as desired height.
# - Output:
#   - The calculated tree height in the same units as `distance`.

# Define the TreeHeight function
TreeHeight <- function(degrees, distance) { 
    radians <- degrees * pi / 180 # Converts degrees to radians
    height <- distance * tan(radians) # Calculate height using tangent function
    return(height) # Return the calculated height 
}

# `process_tree_heights` function:
# - Reads CSV file (tree distance & angle data), calculates tree heights,
#   and saves the results to a new CSV file.
# - Arguments:
#   - `filename`: Name of the input CSV file located in `../data/` directory.
# - Output:
#   - New CSV file in `../results/` directory with calculated tree heights.

process_tree_heights <- function(filename) { 
    # Get the file path 
    filepath <- file.path("../data", filename) 
    results_filepath <- file.path("../results", "TreeHts.csv")
    
    # Read in the trees.csv file 
    df <- read.csv(filepath)

    # Check for column names 
    if (!all(c("Distance.m", "Angle.degrees") %in% colnames(df))) {
        stop("Must have distance & degrees columns: Distance.m, Angle.degrees.")
    }

    # Apply the TreeHeight function to each row and add to new column 
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


# Example 1: Calculating the height of a single tree
# Angle = 37°, Distance = 40m
example_height <- TreeHeight(37, 40)
print(paste("Example Tree Height:", example_height, "m"))
# Expected output:
# [1] "Example Tree Height: 30.2003819662181 m"
