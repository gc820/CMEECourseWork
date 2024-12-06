#!/usr/bin/env Rscript

# File: Sws.ho6.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Hand out 6 R script for stats week. Contains random sampling of
#              numbers, plotting and statistical power analyses. 

rm(list=ls())

#install.packages("WebPower")
require(WebPower)

# Effect size (d) - the difference between two means/SD 
# -> ratio-effect size to standard deviation 

0.3/1.2 #ie. d=0.25 
# Want to detect an effect size 1/4 of a SD 

y <- rnorm(51, mean=1, sd=1.3)
x <- seq(from=0, to=5, by=0.1)
length(x)
plot(hist(y, breaks=10))
mean(y)
sd(y)
segments(x0=(mean(y)), y0=(0), x1=(mean(y)), y1=40, lty=1, col="blue")
# and now 0.25 sd left of the mean (because females are larger)
segments(x0=(mean(y)+0.25*sd(y)), y0=(0), x1=(mean(y)+0.25*sd(y)), y1=40, lty
         =1, col="red")

# Statistical power analysis for t-tests
?wp.t
  # Effect size=0.25; Alpha(default)=0.05, 
  # statistical power=0.8 (or higher ~ reasonable to have 20% chance of a false negative)
  # type=two sample (bc we have 2 samples, not comparing a sample against a fixed mean)
  # Alternative - direction of the alternative hypothesis (default two.sided)
  # Tolerance (another varable )
wp.t(d=0.25, power=0.8, type="two.sample", alternative="two.sided")

# Power curve 
# Shows how much the power increases with increasing sample size of one group
res.1<-wp.t(n1=seq(20,300,20), n2=seq(20,300,20), d=0.25, type="two.sample.2n", alternative="two.sided")
res.1
plot(res.1, xvar='n1', yvar='power')

# Can conduct a power analysis to perform power calculations based on estimated effect size
# Desired power (norm 0.8), significance (norm 0.05)

## EXERCISES ##
# What is the statistical power? 
wp.t(n1=300, d=0.11, type="two.sample", alternative="two.sided")
# 0.2698
# i.e. very low statistical power - not reliable 
# Need a much larger sample size 
wp.t(d=0.11, power=0.8, type="two.sample", alternative="two.sided")
