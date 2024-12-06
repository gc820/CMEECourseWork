#!/usr/bin/env Rscript

# File: Florida.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Analyze the annual mean temperature data from Florida, 
#              testing for normality & correlation, with permutation test to 
#              evaluate the significance between year and temperature. 
#              Calculates asymptotic p-value. 

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("Florida.R")
#   Generates scatter plot with regression line saved as 
#   "../data/Temp_Year_florida.pdf"

# Dependencies:
#   Requires the `ggplot2` package for visualization.
#   Install via: install.packages("ggplot2")


# Load & examine the annual temperature dataset
rm(list=ls())
load("../data/KeyWestAnnualMeanTemperature.RData")
ls()
class(ats)
head(ats)
plot(ats)

library(ggplot2)

pdf("../results/Temp_Year_florida.pdf", width=7, height=5)
ggplot(data=ats, aes(x=Year, y=Temp)) + 
    geom_point(colour="#222285") + 
    labs(x="Year", y="Temperature (degrees celcius)") +
    theme_classic() +
    theme(axis.text=element_text(size=13), axis.title=element_text(size=15)) + 
    geom_smooth(method='lm', se=FALSE)
dev.off()
    

# Use Shapiro wilk test to test normality pof residuals 
shapiro.test(ats$Temp) # does not reject H0 

# Correlation test: Pearson's (normal distribution)
cor.test(ats$Year, ats$Temp, method ="pearson")
# cor = 0.533, p-val = 1.12e-08 

# Setting up the random sampling for correlation test:
# Original correlation 
orig_cor <- cor(ats$Year, ats$Temp, method="pearson")

# Parameters for the permutation test 
num_simul <- 1000 # Set the resampling number
simul_list <- numeric(num_simul) # Preallocation of empty vector 

set.seed(123) # For reproducibility 

# Use for loop to iterate through the number of temperature simulations
for (i in 1:num_simul) {
    rand_temp <- sample(ats$Temp)
    simul_list[i] <- cor(ats$Year, rand_temp, method = "pearson")
}

# Print the results 
print(paste("Original correlation: ", orig_cor))
summary(simul_list)

pdf("../results/hist_florida.pdf", width=6, height=5)
hist(simul_list, main = "Histogram of Shuffled Correlations",
     xlab = "Correlation Coefficient", breaks = 30)
abline(v=orig_cor, col="red", lwd=2,lty=2)
dev.off()


# Calculating the ratio of the numer of values above the original correlation
# Checks each value to see if meets condition (TRUE/FALSE)
count_greater <- sum(simul_list >= orig_cor) # Returns number of times TRUE 
# Calculates the ratio/approx., asymptotic p-value 
ratio <- count_greater / length(simul_list)
print(ratio)

