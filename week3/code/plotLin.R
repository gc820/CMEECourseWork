#!/usr/bin/env Rscript

# File: plotLin.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script generates a scatter plot of simulated data with a linear 
#              regression line and mathematical annotations. It outputs the plot as a PDF.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("plotLin.R")
#   # The script generates a linear regression plot and saves it to `../results/MyLinReg.pdf`.

# Dependencies:
#   Requires `ggplot2` package for plotting.
#   Install if needed: install.packages("ggplot2")

## Linear regression plot annotation 
# Mathematical display 

# Creating 'data'
x <- seq(0, 100, by = 0.1)
y <- -4. + 0.25 * x + 
    rnorm(length(x), mean = 0., sd = 2.5)

# put in a data frame
my_data <- data.frame(x = x, y = y)

# perform a linear regression 
my_lm <- summary(lm(y ~ x, data = my_data))

# plot the data
p <- ggplot(my_data, aes(x=x, y=y, colour = abs(my_lm$residual))) +
    geom_point() +
    scale_colour_gradient(low="black", high="red") +
    theme(legend.position = "none") +
    scale_x_continuous(expression(alpha^2 * pi / beta *sqrt(Theta)))

# add the regression line 
p <- p + geom_abline(intercept = my_lm$coefficients[1][1],
    slope = my_lm$coefficients[2][1],
    colour = "red")

# throw some maths on the plot 
p <- p + geom_text(aes(x=60, y=0,
    label = "sqrt(alpha) * 2* pi"),
    parse = TRUE, size = 6, 
    colour = "blue")
p

pdf("../results/MyLinReg.pdf")
print(p)
dev.off()