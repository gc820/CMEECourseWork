#!/usr/bin/env Rscript

# File: PP_Regress.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Visualisation of predator-prey mass relationships in a scatter 
#            plot with linear regression lines, split by feeding interaction 
#            type. Extracts key statistics for each combination of feeding 
#            interaction type, saving to a csv file. 

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("PP_Regress.R")
#   # The script generates a scatter plot with regression lines, saved as 
#   # `../results/PP_Regress.pdf`
#   # The results are saved to `../results/PP_Regress_Results.csv`.

# Dependencies:
#   Requires the following R packages:
#     - `ggplot2` for visualization
#     - `tidyr` and `dplyr` for data manipulation
#     - `broom` for extracting regression summaries
#   Install if needed:
#     install.packages(c("ggplot2", "tidyr", "dplyr", "broom"))


MyDF <- as.data.frame(read.csv("../data/EcolArchives-E089-51-D1.csv"))
MyDF$Predator.lifestage <- as.factor(MyDF$Predator.lifestage)

p1<-ggplot(MyDF, aes(y = Predator.mass, x = Prey.mass, 
    colour = Predator.lifestage)) +
    geom_point(shape = 3) +
    geom_smooth(method="lm", se=TRUE, aes(group=Predator.lifestage), 
    fullrange=TRUE) +
    facet_grid(Type.of.feeding.interaction ~ .) + 
    scale_x_log10() +
    scale_y_log10() +
    labs(x = "Prey mass in grams", y = "Predator mass in grams") +
    theme_grey() +
    theme(legend.position="bottom", 
    legend.direction="horizontal", 
    legend.box="horizontal",
    legend.text = element_text(size = 8),
    legend.spacing.x = unit(0.2, 'cm')) +
    guides(colour = guide_legend(nrow = 1)) +
    coord_fixed(ratio = 0.3)  # Adjust ratio to make facets narrower

pdf("../results/PP_Regress.pdf")
print(p1)
dev.off()

# Collect the results of the linear model 
library(tidyr)
library(dplyr)
library(broom)

results <- MyDF  %>% 
    # Group the data by feeding interaction and predator lifestage 
    group_by(Type.of.feeding.interaction, Predator.lifestage)  %>% 
    # Summarize performs linear model for each group & stores in model column 
    summarize(model = list(lm(log(Predator.mass)~log(Prey.mass), data=.)),
        .groups = "drop") %>%  
    # Remove grouping variable after calculating summary stats for each subset
    # Extract regression results for each model - apply functions to each model
    mutate( # Using annonymous functions
        slope = sapply(model, function(x) coef(x)[2]),
        intercept = sapply(model, function(x) coef(x)[1]),
        r_squared = sapply(model, function(x) summary(x)$fstatistic[1]),
        f_statistic = sapply(model, function(x) summary(x)$fstatistic[1]),
        p_value = sapply(model, function(x) summary(x)$coefficients[2,4])
    ) %>% 
    # Pick column needed for output (i.e. remove model column)
    select(Type.of.feeding.interaction, Predator.lifestage, slope, intercept, 
    r_squared, f_statistic, p_value)

write.csv(results, "../results/PP_Regress_Results.csv", row.names = FALSE)

