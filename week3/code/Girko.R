#!/usr/bin/env Rscript

# File: Girko.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script visualizes the eigenvalues of a random matrix using the 
#              Girko circular law. It generates a scatter plot of the eigenvalues 
#              overlaid with an ellipse representing the theoretical boundary.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("Girko.R")
#   # The script will generate a plot of eigenvalues with an overlayed ellipse and 
#   # save it to `../results/Girko.pdf`.

# Dependencies:
#   Requires `ggplot2` package for plotting.
#   Install if needed: install.packages("ggplot2")

# Load necessary library
library(ggplot2)

# Plotting two dataframes together 
build_ellipse <- function(hradius, vradius){  #function that returns an ellipse 
    npoints = 250
    a <- seq(0, 2*pi, length = npoints + 1)
    x <- hradius * cos(a)
    y <- vradius * sin(a)
    return(data.frame(x=x, y=y))
}

N <- 250 # assign size of the matrix 
M <- matrix(rnorm(N*N), N, N) # Build the matrix 
eigvals <- eigen(M)$values # find eigenvalues 
eigDF <- data.frame("Real" = Re(eigvals), "Imaginary" = Im(eigvals)) # Build a dataframe
my_radius <- sqrt(N) # the radius of th circle is sqrt(N)
ellDF <- build_ellipse(my_radius, my_radius) # dataframe to plot the ellipse 
names(ellDF) <- c("Real", "Imaginary") # rename the columns 

# Plot the eigenvalues 
p <- ggplot(eigDF, aes(x = Real, y = Imaginary))
p <- p +
  geom_point(shape = I(3)) +
  theme(legend.position = "none")

# now add the vertical and horizontal line
p <- p + geom_hline(aes(yintercept = 0))
p <- p + geom_vline(aes(xintercept = 0))

# finally, add the ellipse
p <- p + geom_polygon(data = ellDF, aes(x = Real, y = Imaginary, alpha = 1/20, fill = "red"))

pdf("../results/Girko.pdf")
print(p)
dev.off()