#!/usr/bin/env Rscript

# File: Sws.ho12.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Hand out 12 R script for stats week. Contains anovas, post-hoc
#               tests, statistical modelling and data wrangling. 

rm(list=ls())

library(dplyr)

d <- read.table("../data/SparrowSize.txt", header = TRUE)

d1 <- subset(d, d$Wing!="NA")
summary(d1$Wing)
hist(d1$Wing)

# Looking at differences between 2 groups 
model1 <- lm(Wing~Sex.1, data=d1)
summary(model1)
boxplot(d1$Wing~d1$Sex.1, ylab="Wing length (mm)")

anova(model1)
t.test(d1$Wing~d1$Sex.1, var.equal=TRUE)

# Looking at multiple groups 
boxplot(d$Mass ~ d$Year)

m2 <- lm(Mass~as.factor(Year), data=d)
anova(m2)
summary(m2)
# Only get differences between a year and the reference level 
# TukeyHSD - needs a fitted model of the aov() fit 
am2 <- aov(Mass~as.factor(Year), data=d)
summary(am2)
TukeyHSD(am2)

# 1) 

# What if there are many more levels? 
# looking at the wing length of individual birds over time 
boxplot(d1$Wing~d1$BirdID, ylab="Wing length(mm)")

require(dplyr)

tbl_df(d1)  # Coerce df to a tibble 
glimpse(d1)

d$Mass %>% cor.test(d$Tarsus, na.rm=TRUE)

d1 %>% 
  group_by(BirdID) %>% 
  summarise(count=length(BirdID)) 
  # Summarise makes 1 row from many rows of data 
  # Takes each group of same BirdID & summarises counting num lines each group

# A faster way of using dyplr to get the output we want... 
d1 %>% 
  group_by(BirdID) %>% 
  summarise(count=length(BirdID)) %>% 
    count(count)
  # Gives you the number of birds that have been measured 1< times 

# Running the ANOVA 
model3 <- lm(Wing~as.factor(BirdID), data=d1)
anova(model3)
# Shows that the among group (mean squares) BirdID > within group (residuals)

# Calcualting n0 for uneven sample size datasets 
d1 %>% 
  group_by(BirdID) %>% 
  summarise(count=length(BirdID)) %>% 
  summarise(sum(count^2))
(1/617)*(1695-7307/1695)
# 2.74 (n0 ~ a sort of centrality measure of how many observations per group)
# Because the diffs are so extreme, we can't use a mean - so need to use n0 

# Now we can calculate repeatability 
((13.20-1.62)/2.74)/(1.62+(13.20-1.62)/2.74)
# 0.72 
# i.e. 72% of variation in wing length is explained by among-individ diffs 
# 18% residual variance remains (within birds)

## EXERCISES ## 
# 1) 
aconite <- read.csv("../data/Aconite.csv")
summary(aconite)
hist(aconite$d1)
hist(aconite$d2)
hist(aconite$c)

# 2) 
fly <- read.table("../data/Wylde_single.mounted.txt")
