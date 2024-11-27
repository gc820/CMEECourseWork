#!/usr/bin/env Rscript

# File: MyBars.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: Creates a bar plot with annotated line ranges using ggplot2. 
#              Outputs the plot as a PDF.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("MyBars.R")
#   # The script will generate a line range plot and save it to `../results/MyBars.pdf`.

# Dependencies:
#   Requires `ggplot2` package for plotting.
#   Install if needed: install.packages("ggplot2")

# Ensure dataset `a` is defined with columns `x`, `y2`, `y3`, and `Label`
# Example data structure:
# a <- data.frame(x = ..., y2 = ..., y3 = ..., Label = ...)

# Load necessary library
library(ggplot2)

a <- read.table("../data/Results.txt", header = TRUE)

#Add a column of zeros for ymin in dataset 'a'
a$ymin <- rep(0, dim(a)[1]) # append a column of zeros 

#print the first linerange 
p <- ggplot(a)

p <- p + geom_linerange(data = a, aes(
                        x = x, ymin = ymin, 
                        ymax = y2, 
                        size = (0.5)), 
                        colour = "#56B4E9", 
                        alpha = 1/2, 
                        show.legend = FALSE)
# Print the third linerange:
p <- p + geom_linerange(data = a, aes(
                          x = x,
                          ymin = ymin,
                          ymax = y3,
                          size = (0.5)),
                        colour = "#D55E00",
                        alpha = 1/2, show.legend = FALSE)

# Annotate the plot with labels:
p <- p + geom_text(data = a, aes(x = x, y = -500, label = Label))

# now set the axis labels, remove the legend, and prepare for bw printing
p <- p + scale_x_continuous("My x axis", breaks = seq(3, 5, by = 0.05)) + 
                            scale_y_continuous("My y axis") + 
                            theme_bw() + 
                            theme(legend.position = "none") 
p

pdf("../results/MyBars.pdf")
print(p)
dev.off()