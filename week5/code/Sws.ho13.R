#!/usr/bin/env Rscript

# File: Sws.ho13.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Hand out 13 R script for stats week. Contains statistical
#               tests, modelling, calculation of repeatability.

rm(list=ls())

a <- read.table("../data/Wylde_single.mounted.txt", header=TRUE)
head(a)

library(lme4)

# Investigate the repeatability of Femur length 
lmm1 <- lmer(Femur_length ~ 1 + (1|ID), data=a)
  # ~1 if you don't want a fixed effect - just estim the intercept 
  # i.e. we want repeatability without any other influence
  # (1|ID) specify random effects - for the model to partition variance into
  # Partition variance into variance explained among ID, and residuals 
summary(lmm1)

# Calculate repeatability 
# Among grp var explained/total var (among+residual(within))
Repeatability <- 1.257/(1.257+0.0003399)
Repeatability #0.999

## Exercises ##
d <- read.table("../data/SparrowSize.txt", header=TRUE)

# 1)
# Tarsus 
lmm2 <- lmer(Tarsus ~1 + (1|BirdID), data=d)
summary(lmm2)
0.6511/(0.6511+0.0957) #0.872
# Slower growth, less drastic yearly changes than other body components

# Wing
lmm3 <- lmer(Wing ~1 + (1|BirdID), data=d)
summary(lmm3)
4.758/(4.758+1.636) #0.744
# Between years changes in mass and growth 

# Mass
lmm4 <- lmer(Mass ~1 + (1|BirdID), data=d)
summary(lmm4)
2.812/(2.812+1.944) #0.591
# Differences between sex and or yearly seasonal/resource changes

# 2) + 3) 
d1 <- subset(d, d$Wing!="NA")

lmm5 <- lm(Wing~Sex.1, data=d1)
summary(lmm5)

lmm5a <- lmer(Wing~Sex.1 + (1|BirdID), data=d1)
summary(lmm5a)

lmm5b <- lmer(Wing~Sex.1 + (1|BirdID) + (1|Year), data=d1)
summary(lmm5b)
