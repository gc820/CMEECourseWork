#!/usr/bin/env Rscript

# File: Sws.ho2.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Hand out 2 R script for stats week. Contains data wrangling and 
#              calculations, including plotting in R.


rm(list=ls())
d<-read.table("../data/SparrowSize.txt", header=TRUE)
str(d)

names(d)
head(d)

hist(d$Tarsus)
mean(d$Tarsus, na.rm=TRUE)
median(d$Tarsus, na.rm=TRUE)
mode(d$Tarsus)

par(mfrow = c(2, 2))
hist(d$Tarsus, breaks = 3, col="grey")
hist(d$Tarsus, breaks = 10, col="grey")
hist(d$Tarsus, breaks = 30, col="grey")
hist(d$Tarsus, breaks = 100, col="grey")

head(table(d$Tarsus))

d$Tarsus.rounded <- round(d$Tarsus, digits=1)
head(d$Tarsus.rounded)

require(dplyr)
d2<-subset(d, d$Tarsus!="NA")
length(d$Tarsus)-length(d2$Tarsus)

TarsusTally <- d2 %>% count(Tarsus.rounded, sort=TRUE)
TarsusTally[[1]][1]

range(d$Tarsus, na.rm=TRUE)
range(d2$Tarsus, na.rm=TRUE)
var(d$Tarsus, na.rm=TRUE)
var(d2$Tarsus, na.rm=TRUE)

# Sum of squares variance 
sum((d2$Tarsus - mean(d2$Tarsus))^2)/(length(d2$Tarsus) - 1)
var(d2$Tarsus)
# SD 
sqrt(var(d2$Tarsus))
sqrt(0.74)
sd(d2$Tarsus)

# z scores 
zTarsus <- (d2$Tarsus - mean(d2$Tarsus))/sd(d2$Tarsus)
var(zTarsus)
sd(zTarsus)
hist(zTarsus)

znormal <- rnorm(1e+06)
hist(znormal, breaks = 100)
summary(znormal)
qnorm(c(0.025, 0.975))
pnorm(.Last.value)

par(mfrow = c(1,2))
hist(znormal, breaks = 100)
abline(v=qnorm(c(0.25, 0.5, 0.75)), lwd=2)
abline(v = qnorm(c(0.025, 0.975)), lwd = 2, lty = "dashed")
plot(density(znormal))
abline(v = qnorm(c(0.25, 0.5, 0.75)), col = "gray")
abline(v = qnorm(c(0.025, 0.975)), lty = "dotted", col = "black")
abline(h = 0, lwd = 3, col = "blue")
text(2, 0.3, "1.96", col = "red", adj = 0)
text(-2, 0.3, "-1.96", col = "red", adj = 1)
dev.off()

# Exercises 

# 1 
boxplot(d$Tarsus~d$Sex.1, col=c("red", "blue"), ylab="Tarsus length(mm")
  # sexd is used as more descriptive using male/female over 0/1

# 2 
# median = use when non-normal/parametric distribution 

# 3 
# lower precision = wider bin sizes.
# variance of z-stand data = 1

# 4 
# scale() - centers/scales the columns of a numeric matrix by default 

# 5 
# Can also have just changed the x axes labels 

# 6
# the variance/spread of data is different (2 vs 200)