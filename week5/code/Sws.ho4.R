#!/usr/bin/env Rscript

# File: Sws.ho4.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Hand out 4 R script for stats week. Contains basic functions in R
#              to calculate different values from the wrangled dataset, then 
#              performing statistical tests. 


rm(list=ls())
d <- read.table("../data/SparrowSize.txt", header=TRUE)
d1 <- subset(d, d$Tarsus!="NA")

# Package to calculate SE
#install.packages("plotrix")
library(plotrix)
print(std.error(d1$Tarsus))

seTarsus <- sqrt(var(d1$Tarsus)/length(d1$Tarsus))
seTarsus

# Only 2001 year
sub2001 <- subset(d1,Year==2001)
seTarsus2 <- sqrt(var(sub2001$Tarsus)/length(sub2001$Tarsus))
seTarsus2
std.error(sub2001$Tarsus)

mean(d1$Tarsus)
std.error(d1$Tarsus)
mean(sub2001$Tarsus)
std.error(sub2001$Tarsus)

# One sample t-test (one sample)
t.test(sub2001$Tarsus, mu=18.5, na.rm=TRUE)

# Two sample t-test 
t.test(d1$Tarsus ~ d1$Sex, na.rm=TRUE)
# 95 CI is between the two means 

# How to write up the results 
  # Descriptive stats
  # Results of the actual tests you did 

# Wing length 2001 vs grand total wing length 
mean(d1$Wing, na.rm=TRUE) #77.39744
mean(sub2001$Wing, na.rm=TRUE) #77.65263
t.test(sub2001$Wing, mu=77.39744, na.rm=TRUE)
# No difference between means 

tapply(sub2001$Wing, sub2001$Sex.1, mean)
t.test(sub2001$Wing ~ sub2001$Sex.1, na.rm=TRUE)
# Significant difference between means 

tapply(d1$Wing, d1$Sex.1, mean, na.rm=TRUE)
t.test(d1$Wing ~ d1$Sex.1, na.rm=TRUE)
# Significant difference between means 