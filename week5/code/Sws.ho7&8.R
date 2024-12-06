#!/usr/bin/env Rscript

# File: Sws.ho7&8.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Hand out 5 R script for stats week. Contains statistical models,
#              indexing/accessing certain elements and plotting in R. 


## Stats with sparrows 9 
## Running a linear regression 
x <- c(1,2,3,4,8)
y <- c(4,3,5,7,9)
model1 <- (lm(y~x))
model1
summary(model1)
anova(model1)
resid(model1)
cov(x,y)
var(x)
plot(y~x)


## Worksheet 7 
x <- seq(from = -5, to =5, by = 1)
x[[1]]
x[1]
x[[length(x)]]

i <- 1
x[[i]]
i <- seq(0,10,1)
i 
x[[i[[2]]]]

a <- 2
b <- 1
y <- a + b * x
plot(x,y)
segments(0,-10,0,10, lty=3)
segments(-10,0,10,0, lty=3)

plot(x,y, col="white")
segments(0,-10,0,10, lty=3)
segments(-10,0,10,0,lty=3)
abline(a = 2, b=1)

points(4,0, col="red", pch=19)
points(-2,6, col="green", pch=9)
points(x,y, pch=c(1,2,3,4,5,6,7,8,9,10,11))

y<-x^2
plot(x,y)
segments(0,-30,0,30, lty=3)
segments(-30,0,30,0,lty=3)

# Predict values 
predict(model1)

## 7) EXERCISES ## 
# 1) 12 kg 

# 2) 80 species 

# 3) To find the age at the max point: 
    # y = -1 + 2x = 0.15x^2
    # x = -(b/2a)
    # x = -(2/2*-0.15) = 2/0.3 
    # 6 years old
# Calc max reproductive success - sub x in 
    # y = -1 + 2(6) - 0.15(6^2)
    # y = 5.6  offspring at max reproductive age 

# 4) y = -1 + 2x - 0.08x^2 
    # When x (area ha) = 0, species richness is -1 (i.e. just very small)
    # b1 slope =2 -> as initailly area increases, so does the number of species
    # approx 2 species per ha (+ve relationship in early stages of small reserves)
    # b2 quadratic slope =-0.08 - rate at which species richness increases, slows down and declines
    # ie. suggests an optimal reserve size where species richness no longer increases 


## Worksheet 8 
rm(list=ls())
x<-c(1,2,3,4,8)
y<-c(4,3,5,7,9)
mean(x)
var(x)
mean(y)
var(y)

model1 <- (lm(y~x))
model1
summary(model1)
  coefficients(model1)
  resid(model1)
  mean(resid(model1))
  var(resid(model1))
  length(resid(model1))
  
plot(y~x, pch=19, xlim=c(0,8.5), ylim=c(0,9.5)) # Response ~ explanatory variable 
segments(0,-30,0,30, lty=3)
segments(-30,0,30,0,lty=3)
coefficients(model1)
abline(2.62, 0.83)

x<-seq(from=-10, to=10, by=0.2)
x
y <- 7.1-0.2*x
y 
summary(lm(y~x))
plot(y~x)

y<- 7.1-0.2 * x + runif(length(x))
summary(lm(y~x))


## Exercises
?lm
require(graphics)

## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept

anova(lm.D9)
summary(lm.D90)

opar <- par(mfrow = c(2,2), oma = c(0, 0, 1.1, 0))
plot(lm.D9, las = 1)      # Residuals, Fitted, ...
par(opar)

?runif
u <- runif(20)
## The following relations always hold :
punif(u) == u
dunif(u) == 1

var(runif(100000))  #- ~ = 1/12 = .083
