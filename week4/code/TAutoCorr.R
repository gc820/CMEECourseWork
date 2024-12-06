#!/usr/bin/env Rscript

# CMEE Groupwork
# Autocorrelation in Florida weather
# QUESTION: Are temperatures of one year significantly correlated with the next year (successive years), 
#           across years in a given location?

library(ggplot2)
library(cowplot)

# STEPS
# 1. Compute the appropriate correlation coefficient between successive years and store it (look at the help file for cor()
# 2. Repeat this calculation a sufficient number of times by – randomly permuting the time series, and then recalculating the correlation coefficient for each randomly permuted sequence of annual temperatures and storing it.
# 3. Then calculate what fraction of the correlation coefficients from the previous step were greater than that from step 1 (approximate p-value).


### Data
load("../data/KeyWestAnnualMeanTemperature.RData")

t1 <- ats$Temp[1:99]; t2 <- ats$Temp[2:100]
p1 <- ggplot(data.frame(t1 = t1, t2 = t2), aes(x = t1, y = t2)) +
  geom_point() +
  stat_smooth(method="lm", se=FALSE, colour = "red") +
  labs(x = "Temperature", y = "Following Year Temperature") +
  theme_classic()  
p1


### Analysis
# Observed correlation coefficient
obs_corr <- cor(ats$Temp[-length(ats$Temp)], ats$Temp[-1])

# Permutation test
perm.test <- function(dat = ats$Temp, n = 9999){
  perm_corr <- rep(NA, n)
  set.seed(123)
  for (i in 1:n) {
    perm_temps <- sample(dat, replace = FALSE)  
    perm_corr[i] <- cor(perm_temps[-length(perm_temps)], perm_temps[-1])
  }
  return(perm_corr)
}

# p-value
perm_corr <- perm.test()
p_value <- mean(perm_corr >= obs_corr)


### Correlation Density
p2 <- ggplot(as.data.frame(perm_corr), aes(x=perm_corr)) +
  geom_histogram(colour="white", fill="royalblue2") +
  geom_vline(xintercept = obs_corr, colour = "red", size=1.5) +
  labs(x="Correlation Coefficient", y="Frequency") +
  xlim(-0.35,0.35) +
  theme_classic()
p2


### Save to PDF
plots <- plot_grid(p1, p2, nrow=1, labels = c("A", "B"))
pdf(paper = "a4r", width = 0, height = 0,"../results/floridaplots.pdf")
print(plots)
graphics.off()


# END
