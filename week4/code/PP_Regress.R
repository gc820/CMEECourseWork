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
    facet_grid(Type.of.feeding.interaction ~ ., scales = "fixed") + 
    scale_x_log10() +
    scale_y_log10() +
    labs(x = "Prey mass in grams", y = "Predator mass in grams") +
    theme_bw() +
    theme(legend.position="bottom", 
    legend.direction="horizontal", 
    legend.box="horizontal",
    legend.text = element_text(size = 8),
    legend.title = element_text(face = "bold"),
    legend.spacing.x = unit(0.2, 'cm')) +
    guides(colour = guide_legend(nrow = 1)) +
    coord_fixed(ratio = 0.3)  # Adjust ratio to make facets narrower

pdf("../results/PP_Regress.pdf")
dev.off()

# Collect the results of the linear model 
library(tidyr)
library(dplyr)

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
    group_by(Type.of.feeding.interaction, Predator.lifestage)  %>% 
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

# Save results
write.csv(results, "../results/PP_Regress_Results.csv", row.names = FALSE)
