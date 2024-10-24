#!/usr/bin/env Rscript

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

TreeHeight <- function(degrees, distance) { 
    radians <- degrees * pi / 180 # Converts degrees to radians
    height <- distance * tan(radians) # Calculates the height using tangent function
    print(paste("Tree height is:", height))

    return(height) # Returns the calculated height as output 
}

TreeHeight(37, 40)