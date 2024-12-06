#!/usr/bin/env Rscript

# File: Sws.ho11.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Nov 2024
# Description: Hand out 11 R script for stats week. Contains lots of different
#              types of plots with calculated standard error checks.  
# 


rm(list=ls())

daphnia <- read.delim("../data/daphnia.txt")
summary(daphnia)
head(daphnia)
str(daphnia)

# Check for any potential outliers 
par(mfrow=c(1,2))
plot(Growth.rate ~ as.factor(Detergent), data=daphnia)
plot(Growth.rate ~ as.factor(Daphnia), data=daphnia)

# Homogeneity of variances 
require(dplyr)

daphnia %>% 
  group_by(Detergent) %>% 
  summarise(variance=var(Growth.rate))

daphnia %>%
  group_by(Daphnia) %>%
  summarise (variance=var(Growth.rate))

dev.off()

hist(daphnia$Growth.rate)

seFun <- function(x) {
  sqrt(var(x)/length(x))
}
detergentMean <- with(daphnia, tapply(Growth.rate, INDEX = Detergent,
                                      FUN = mean))
detergentSEM <- with(daphnia, tapply(Growth.rate, INDEX = Detergent,
                                     FUN = seFun))
cloneMean <- with(daphnia, tapply(Growth.rate, INDEX = Daphnia, FUN = mean))
cloneSEM <- with(daphnia, tapply(Growth.rate, INDEX = Daphnia, FUN = seFun))


par(mfrow=c(2,1),mar=c(4,4,1,1))
barMids <- barplot(detergentMean, xlab = "Detergent type", ylab = "Population growth rate", ylim = c(0, 5))
arrows(barMids, detergentMean - detergentSEM, barMids, detergentMean +
         detergentSEM, code = 3, angle = 90)

barMids <- barplot(cloneMean, xlab = "Daphnia clone", ylab = "Population growth rate", ylim = c(0, 5))
arrows(barMids, cloneMean - cloneSEM, barMids, cloneMean + cloneSEM,
       code = 3, angle = 90)

daphniaMod <- lm(Growth.rate ~ Detergent + Daphnia, data = daphnia)
summary(daphniaMod)

detergentMean - detergentMean[1]
cloneMean - cloneMean[1]

# Tukey HSD test
daphniaANOVAMod <- aov(Growth.rate ~ Detergent + Daphnia, data=daphnia)
summary(daphniaANOVAMod)
daphniaModHSD <- TukeyHSD(daphniaANOVAMod)
daphniaModHSD

par(mfrow=c(2,1),mar=c(4,4,1,1))
plot(daphniaModHSD)

par(mfrow=c(2,2))
plot(daphniaMod)

# Multiple regression 
timber <- read.delim("../data/timber.txt")
summary(timber)
str(timber)
head(timber)

# Outliers 
par(mfrow = c(2, 2))
boxplot(timber$volume)
boxplot(timber$girth)
boxplot(timber$height)

# Homogeneity of variances 
var(timber$volume)
var(timber$girth)
var(timber$height)

t2 <- as.data.frame(subset(timber, timber$volume!="NA"))
t2$z.girth <- scale(timber$girth)
t2$z.height <- scale(timber$height)
var(t2$z.girth)
var(t2$z.height)
plot(t2)

# Are the data normally distributed 
par(mfrow = c(2, 2))
hist(t2$volume)
hist(t2$girth)
hist(t2$height)

# Is ther collinearity among the covariates 
pairs(timber)
cor(timber)

summary(lm(girth~height, data=timber))
# VIF = 1/1-R^2 
VIF <- 1/(1-0.27)
VIF
sqrt(VIF)

pairs(timber)
cor(timber)
pairs(t2)
cor(t2)

timberMod <- lm(volume ~ girth + height, data=timber)
anova(timberMod)
summary(timberMod)

# Model validation 
plot(timberMod)

## Exercises ##

# 1) removing outlier [31]
t3 <- timber[-31,]
timberMod2 <- lm(volume ~ girth + height, data=t3)
anova(timberMod2)
summary(timberMod2)

par(mfrow = c(2, 2))
plot(timberMod2)

  # I think I would keep the outlier since removing it doesn't seem 
  # to be impacting the results of the model at all and the residual 
  # plots also don't seem to be much better without it excluded

# 2) 
plantGrowth <- read.delim("../data/ipomopsis.txt")
# Outliers
par(mfrow = c(2, 2))
boxplot(plantGrowth$Root)
boxplot(plantGrowth$Fruit) # No outliers appearance 
# Homogeneity of variances
var(plantGrowth$Root)
var(plantGrowth$Fruit)
pg2 <- as.data.frame(subset(plantGrowth, plantGrowth$Fruit!="NA"))
pg2$z.root <- scale(plantGrowth$Root)
pg2$z.fruit <- scale(plantGrowth$Fruit)
var(pg2$z.root)
var(pg2$z.fruit)
plot(pg2)
# Data normal distribution 
par(mfrow = c(2, 2))
hist(pg2$Root)
hist(pg2$Fruit) # Yes, fairly normal distribution with continuous variables 
# No excessive zeros 
# Collinearity 
cor(plantGrowth[,1:2])
pairs(pg2[,1:2])
pgMod <- lm(Fruit ~ Root + Grazing, data=plantGrowth)
summary(pgMod)
VIF <- 1/(1-0.93)
VIF  # VIF is very high (14.29)
#Visual inspection 
cor.test(plantGrowth$Fruit, plantGrowth$Root)
plot(plantGrowth$Fruit, plantGrowth$Root)

par(mfrow=c(2,1))
boxplot(Fruit ~ Grazing, data = plantGrowth,
        main = "Fruit by Grazing Level",
        xlab = "Grazing",
        ylab = "Fruit",
        col = "lightblue")
boxplot(Root ~ Grazing, data = plantGrowth,
        main = "Root by Grazing Level",
        xlab = "Grazing",
        ylab = "Root",
        col = "lightblue")
library(ggplot2)
ggplot(plantGrowth, aes(x = Root, y = Fruit, color = Grazing)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Fruit vs Root by Grazing Level",
       x = "Root",
       y = "Fruit") +
  theme_minimal()

anova(pgMod)
summary(pgMod)
plot(pgMod)

# 3) 
rm(list=ls())
d <- read.table("../data/SparrowSize.txt", header=TRUE)
anyNA(d)
d1 <- na.omit(d) # Omit NA values 
# Exploratory plots
pairs(d1[, c("Mass", "Tarsus", "Wing", "Bill")], main = "Pairs Plot for Sparrow Data")
# Check collinearity 
cor(d1[,c("Tarsus", "Wing", "Bill")]) # None with high collinearity 

# Null model 
nullMod <- lm(Mass ~ 1, data=d1)
maxMod <- lm(Mass ~ Tarsus + Wing + Bill, data=d1)
summary(maxMod)

# Model selection
tarsus <- lm(Mass ~ Tarsus, data=d1)
summary(tarsus)
wing <- lm(Mass ~ Wing, data=d1)
summary(wing)
bill <- lm(Mass~Bill, data=d1)
summary(bill) 
model1 <- lm(Mass ~ Tarsus + Wing, data = d1)
summary(model1)
model2 <- lm(Mass ~ Tarsus + Bill, data = d1)
summary(model2)
model3 <- lm(Mass ~ Wing + Bill, data = d1)
summary(model3)

# Compare AIC scores for all models
aic_results <- AIC(nullMod, tarsus, wing, bill, model1, model2, model3, maxMod)
aic_results[order(aic_results$AIC), ] # Order the AIC values

# Therefore the Maximum model, including tarsus, wing and bill,
# was found to be the best predictor of mass
