#!/usr/bin/env Rscript

# File: Sws.ho1.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Hand out 1 R script for stats week. Contains basic functions in R
#             for testing out built-in R funtions and importing data. 


#Clear the workspace 
rm(list=ls())

# Calculator commands in R
2*2+1
12/2^3

# Assign values to variables
x <- 5
y <- 2
x2 <- x^2
y2 <- y^2
z2 <- x2 + y2
z <- sqrt(z2)
print(z)

# Logical tests 
3>2
3 >= 3
4<2

# Vectors 
myNumericVector <- c(1.3,2.5,1.9,3.4,5.6,1.4,3.1,2.9)
myCharacterVector <- c("low","low","low","low","high","high","high","high")
myLogicalVector <- c(TRUE,TRUE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE)
str(myNumericVector)
myMixedVector <-c(1, TRUE, FALSE, 3, "help", 1.2, TRUE, "notwhatIplanned")
str(myMixedVector)

#install.packages("lme4")
library(lme4)
require(lme4)

sqrt(4); 4^0.5; log(0); log(1); log(10); log(Inf) # special notation
exp(1)

d <- read.table("../data/SparrowSize.txt", header=TRUE)
str(d)
table(d$Year)
require(dplyr)
BirdIDCount <- d %>% count(BirdID, BirdID, sort=TRUE)
BirdIDCount %>% count(n)

# Exercises 
# 1 - Number of repeats per bird per year
table(d$BirdID)

# 2 

