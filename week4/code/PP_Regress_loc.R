#!/usr/bin/env Rscript

# File: PP_Regress_loc.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Linear regression analyses on predator-prey mass relationships. 
#            Grouped by location, feeding interaction, and predator life stage. 
#            For each group the regression statistics are calculated and the 
#            results are saved as a CSV file for further analysis.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("PP_Regress_loc.R")
#   The results are saved to `../results/PP_Regress_loc_Results.csv`.

# Dependencies:
#   Requires the following R packages:
#     - `tidyr` and `dplyr` for data manipulation
#     - `broom` for extracting regression summaries
#   Install via:
#     install.packages(c("tidyr", "dplyr", "broom"))


library(tidyr)
library(dplyr)
library(broom)

MyDF <- as.data.frame(read.csv("../data/EcolArchives-E089-51-D1.csv"))
MyDF$Predator.lifestage <- as.factor(MyDF$Predator.lifestage)

results <- MyDF  %>% 
    # Group the data by feeding interaction and predator lifestage 
    group_by(Location, Type.of.feeding.interaction, Predator.lifestage)  %>% 
    # Summarize performs linear model for each group & stores in model column 
    summarize(model = list(lm(log(Predator.mass)~log(Prey.mass), data=.)),
        .groups = "drop") %>%  # Remove grouping variable after calculating summary stats for each subset
    # Extract regression results for each model - apply functions to each model
    mutate( # Using annonymous functions
        slope = sapply(model, function(x) coef(x)[2]),
        intercept = sapply(model, function(x) coef(x)[1]),
        r_squared = sapply(model, function(x) summary(x)$fstatistic[1]),
        f_statistic = sapply(model, function(x) summary(x)$fstatistic[1]),
        p_value = sapply(model, function(x) summary(x)$coefficients[2,4])
    ) %>% 
    # Pick column needed for output (i.e. remove model column)
    select(Location, Type.of.feeding.interaction, Predator.lifestage, slope, intercept, r_squared, f_statistic, p_value)

write.csv(results, "../results/PP_Regress_loc_Results.csv", row.names = FALSE)
