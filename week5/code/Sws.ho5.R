#!/usr/bin/env Rscript

# File: Sws.ho5.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Hand out 5 R script for stats week. Contains statistical tests, 
#              on imported dataset, including data wrangling and plotting.

rm(list=ls())
d <- read.table("../data/SparrowSize.txt", header=TRUE)

# Hypothesis testing 
boxplot(d$Mass~d$Sex.1, col=c("red", "blue"), ylab="Body mass (g)")

# H0 = difference is zero 
# H1 = Higher: Males higher body mass than females, Lower: Females higher body mass than males 

t.test1 <- t.test(d$Mass~d$Sex.1)
t.test1
# Found that males have higher body mass than females (significant result)

# Do we see the same if we reduce the sample size to 50? 
d1 <- as.data.frame(head(d, 50))
length(d1$Mass)

t.test2 <- t.test(d1$Mass~d1$Sex)
t.test2
# No differences found with a smaller dataset 
# ie. so with large datasets you are more likely to find small effect sizes 
# Whether the significance is actually biologically meaningful may not be determined from the p-value 


## EXERCISES ##
# 1) 
wing_mean <- mean(d$Wing, na.rm=TRUE)
wing_mean
d3 <- subset(d, d$Year==2001)
t.test3 <- t.test(d3$Wing, mu=77.4)
t.test3 
# Wing mean of 2001 is not significantly different from the grand total mean 

t.test4 <- t.test(d$Wing ~ d$Sex.1)
t.test4
# Significant difference between M and F wing size 

t.test5 <- t.test(d$Tarsus ~ d$Sex.1)
t.test5
# Significant difference between M and F tarsus length 

wing_mean #77.40
unique_yrs <- unique(d$Year)
# Create list to store t test results
t_test_results <- lapply(unique_yrs, function(year) {
  year_data <- d$Wing[d$Year == year] # Subset wing data for year = function(year)
  t.test(year_data, mu=77.40) # t test 
})
names(t_test_results) <- unique_yrs
t_test_results

# Create variable for early/latter years 
d4 <- d
d4$Group <- ifelse(d$Year %in% 2000:2004, "early", "late")
head(d4)
# Tarsus 
tarsus_test <- t.test(d4$Tarsus[d4$Group=="early"], 
                      d4$Tarsus[d4$Group=="late"])
print(tarsus_test)
# Mass
mass_test <- t.test(d4$Mass[d4$Group=="early"], 
                       d4$Mass[d4$Group=="late"])
print(mass_test)
# Wing 
wing_test <- t.test(Wing~Group, data=d4)
wing_test
# Bill 
bill_test <- t.test(Bill~Group, data=d4)
bill_test
