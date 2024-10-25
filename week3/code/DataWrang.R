#!/usr/bin/env Rscript

# File: DataWrang.R
# Author: Georgina Chow georgina.chow20@imperial.ac.uk
# Date: Oct 2024
# Description: This script performs data wrangling on the Pound Hill dataset, converting 
#              raw data to a tidy format suitable for analysis. It involves transposing 
#              data, replacing missing values, converting to long format, and applying 
#              basic summary statistics.

# Usage:
# Run this script from an R session or command line.
# Example usage in R:
#   source("DataWrang.R")
#   # The script loads data, performs wrangling steps, and outputs a summary.

# Dependencies:
#   Requires `reshape2` and `tidyverse` packages for data manipulation.
#   Install if needed: 
#       install.packages("reshape2")
#       install.packages("tidyverse")

################################################################
################## Wrangling the Pound Hill Dataset ############
################################################################

############# Load the dataset ###############
# header = false because the raw data don't have real headers
MyData <- as.matrix(read.csv("../data/PoundHillData.csv", header = FALSE))

# header = true because we do have metadata headers
MyMetaData <- read.csv("../data/PoundHillMetaData.csv", header = TRUE, sep = ";")

############# Inspect the dataset ###############
head(MyData)
dim(MyData)
str(MyData)
fix(MyData) #you can also do this
fix(MyMetaData)

############# Transpose ###############
# To get those species into columns and treatments into rows 
MyData <- t(MyData) 
head(MyData)
dim(MyData)

############# Replace species absences with zeros ###############
MyData[MyData == ""] = 0

############# Convert raw matrix to data frame ###############

# Removes the 1st row 
TempData <- as.data.frame(MyData[-1,],stringsAsFactors = F) #stringsAsFactors = F is important!
colnames(TempData) <- MyData[1,] # assign column names from original data

############# Convert from wide to long format  ###############
require(reshape2) # load the reshape2 package

?melt #check out the melt function

MyWrangledData <- melt(TempData, id=c("Cultivation", "Block", "Plot", "Quadrat"), variable.name = "Species", value.name = "Count")

MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"])
MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])
MyWrangledData[, "Count"] <- as.integer(MyWrangledData[, "Count"])

str(MyWrangledData)
head(MyWrangledData)
dim(MyWrangledData)

############# Exploring the data (extend the script below)  ###############

MyData[MyData == ""]= 0
MyData <- t(MyData)

head(MyData)
colnames(MyData) # R doesn't recognise the column headers 

# Important stringsAsFactors=F --> don't want R to convert columns to factor class
TempData <- as.data.frame(MyData[-1,], stringsAsFactors=F)
head(TempData)

colnames(TempData) <- MyData[1,] # Assign column names from original data
head(TempData)

rownames(TempData) <- NULL
head(TempData)

MyWrangledData <- melt(TempData, id=c("Cultivation", "Block", "Plot", "Quadrat"), variable.name = "Species", value.name = "Count")
head(MyWrangledData); tail(MyWrangledData)

MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"])
MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])
MyWrangledData[, "Count"] <- as.integer(MyWrangledData[, "Count"])
str(MyWrangledData)

require(tidyverse)
tidyverse_packages(include_self = TRUE) # the include_self = TRUE means list "tidyverse" as well 

# Convert the df to a tibble 

MyWrangledData <- dplyr::as_tibble(MyWrangledData)
MyWrangledData
MyWrangledData <- as_tibble(MyWrangledData)
class(MyWrangledData)

glimpse(MyWrangledData) # Similar to str() but nicer 
utils::View(MyWrangledData) # Same as fix()
filter(MyWrangledData, Count>100) #like subset() but nicer
slice(MyWrangledData, 10:15) # Look at a particular range of data rows 

MyWrangledData  %>% 
    group_by(Species)  %>% 
        summarise(avg = mean(Count))

#Can do the same using base R command (not dyplr)
aggregate(MyWrangledData$Count, list(MyWrangledData$Species), FUN=mean)

