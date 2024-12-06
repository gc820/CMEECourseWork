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

MyDF <- as.data.frame(read.csv("../data/EcolArchives-E089-51-D1.csv"))
MyDF$Predator.lifestage <- as.factor(MyDF$Predator.lifestage)
MyDF$Location <- as.factor(MyDF$Location)

# Convert prey mass mg to g 
MyDF <- MyDF %>%
  mutate(
    Prey.mass = case_when(
        Prey.mass.unit == "g" ~ Prey.mass, 
        Prey.mass.unit == "mg" ~ Prey.mass/1000, 
        TRUE ~ NA_real_ # If conitions not met, NA is assigned
    )
)

results <- MyDF  %>%  
    group_by(Location, Type.of.feeding.interaction, Predator.lifestage)  %>% 
    # .x = data for current group, .y contains grouping key (unique combination of the group_by categories)
    group_modify(function(.x, .y){
        if(nrow(.x) >= 3) {  # Creates model for more than 3 data points
            # Fit linear model for group 
            model_summary <- summary(lm(log(Predator.mass) ~ log(Prey.mass), data= .x))
            # Extract coefficients 
            intercept <- round(model_summary$coefficients["(Intercept)", "Estimate"], digits=3)
            slope <- round(model_summary$coefficients["log(Prey.mass)", "Estimate"], digits=3)
            r_squared <- round(model_summary$r.squared, digits=3)
            p_value <- model_summary$coefficients["log(Prey.mass)", "Pr(>|t|)"]
            p_value <- ifelse(
                p_value < 0.001, "<0.001",
                as.character(round(p_value, digits=3)))
            f_statistic <- round(model_summary$fstatistic["value"], digits=3)
            # Create data frame 
            data.frame(
                n = nrow(.x),
                intercept = intercept,
                slope = slope,
                r_squared = r_squared,
                p_value = p_value,
                f_statistic = f_statistic,
                comment = NA
            )
        } else {
            data.frame(
                n = nrow(.x),
                intercept = NA,
                slope = NA,
                r_squared = NA,
                p_value = NA,
                f_statistic = NA,
                comment = "Model not made: less than 3 datapoints"
            )
        }
    }) 

view(results)

# Write csv file 
write.csv(results, "../results/PP_Regress_loc_Results.csv", row.names = TRUE)
