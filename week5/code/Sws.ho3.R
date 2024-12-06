#!/usr/bin/env Rscript

# File: Sws.ho3.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Hand out 3 R script for stats week. Contains functions in R,
#              plotting histograms to visualise data. 


rm(list=ls())
d<-read.table("../data/SparrowSize.txt", header=T)
str(d)

# Determine type of each variable 
str(d)

# Look at their distributions 
hist(d$Tarsus)
hist(d$Mass)
hist(d$Wing)

x <- seq(5, 15, length=1000)

# Gaussian (normal)
# pnorm()

# Poisson 
# ppois()

# Binomial 
# pbinom()

# Random 
# rnorm()
