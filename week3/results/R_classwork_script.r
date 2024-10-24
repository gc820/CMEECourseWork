#R_classwork

# Importing and Exporting Data
MyData <- read.csv("../data/trees.csv")

ls(pattern =  "My*") # Check that the file has appeared 
class(MyData)
head(MyData)
str(MyData) #Details of columns and data types

MyData <- read.csv("../data/trees.csv", header = F) # ignore headers
head(MyData)

MyData <- read.table("../data/trees.csv", sep = ',', header = TRUE) #(another way)
head(MyData)

MyData <- read.csv("../data/trees.csv", skip = 5) # Skip first 5 lines

# Writing to and saving files 
write.csv(MyData, "../results/MyData.csv")
dir("../results/")
write.table(MyData[1,], file = "../results/MyData.csv", append=TRUE)
write.csv(MyData, "../results/MyData.csv", row.names=TRUE) #Write row names 
write.table(MyData, "../results/MyData.csv", col.names=FALSE) #Ignore col names 

# For loops
for (i in 1:10) {
    j <- i * i 
    print(paste(i, " squared is", j))
}

for(species in c('Heliodoxa rubinoides', 'Boissonneaua jardini', 'Sula nebouxii')) {
    print(paste('The species is', species ))
}

v1 <- c("a", "bc", "def")
for (i in v1) {
    print(i)
}

# while loops 
i <- 0 
while (i <10) {
    i <- i+1 
    print(i^2)
}

# Vectorization
a <- 1.0
class(a)


# Vectorization example 
set.seed(12345)
popn <- rnorm(10000) # Generate the population
hist(popn)

n <- 100 # sample size for each experiment
num <- 10000 # Number of times to rerun the experiment

print("Using loops without preallocation on a vector took:" )
print(system.time(loopy_sample1(popn, n, num)))

print("Using loops with preallocation on a vector took:" )
print(system.time(loopy_sample2(popn, n, num)))

print("Using loops with preallocation on a list took:" )
print(system.time(loopy_sample3(popn, n, num)))

print("Using the vectorized sapply function (on a list) took:" )
print(system.time(sapply_sample(popn, n, num)))

print("Using the vectorized lapply function (on a list) took:" )
print(system.time(lapply_sample(popn, n, num)))

#tapply function 
x <- 1:20 # a vector
x
y <- factor(rep(letters[1:5], each = 4))
y
tapply(x, y, sum)

#Using by 
attach(iris)
iris

by(iris[,1:2], iris$Species, colMeans)
by(iris[,1:2], iris$Petal.Width, colMeans)

#Using replicate 
replicate(10, runif(5)) #runif function generates (5) random numbers


# Catching errors 

doit <- function(x) {
    temp_x <- sample(x, replace = TRUE)
    if(length(unique(temp_x)) > 30) { #Only take mean if sample was sufficient
        print(paste("Mean of this sample was:", as.character(mean(temp_x))))
        }
    else {
        stop("Couldn't calcualte mean: too few unique values!")
    }
}

set.seed(1345) # Again, to get the same result for illustration 
popn <- rnorm(50)
hist(popn)

#Now using lapply 
lapply(1:15, function(i) doit(popn))
#Now using try 
result <- lapply(1:15, function(i) try(doit(popn), FALSE))
class(result)
result

result <- vector("list", 15) #Preallocate/Initialize
for(i in 1:15) {
    result[[i]] <- try(doit(popn), FALSE)
    }




#BASIC PLOTTING COMMANDS R
MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")
dim(MyDF)
str(MyDF)
head(MyDF)

require(tidyverse)
glimpse(MyDF)

MyDF$Type.of.feeding.interaction <- as.factor(MyDF$Type.of.feeding.interaction)
MyDF$Location <- as.factor(MyDF$Location)
str(MyDF)

# Scatter plots 
plot(MyDF$Predator.mass, MyDF$Prey.mass)
plot(log(MyDF$Predator.mass), log(MyDF$Prey.mass)) #Taking the log 
plot(log10(MyDF$Predator.mass), log10(MyDF$Prey.mass)) #log10 to see orders of magnitude
plot(log10(MyDF$Predator.mass), log10(MyDF$Prey.mass), pch=20) #Change the markers 
plot(log10(MyDF$Predator.mass),log10(MyDF$Prey.mass),pch=20, xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") # Add labels

#HISTOGRAMS
hist(MyDF$Predator.mass)
hist(log10(MyDF$Predator.mass), xlab = "log10(Predator Mass(g))", ylab = "Count",
    col = "lightblue", border = "pink") #Include labels, change bar and border colours
hist(log10(MyDF$Prey.mass), xlab = "log10(Prey Mass(g))", ylab = "Count")

#SUBPLOTS
par(mfcol=c(2,1)) #initalize multi-paneled plot (2rows)
par(mfg = c(1,1)) # specify which sub-plot to use 1st
hist(log10(MyDF$Predator.mass), 
    xlab = "log10(Predator Mass (g))", ylab = "Count", col = "lightblue", border = "pink",
    main = 'Predator') #Add title 
par(mfg = c(2,1)) # Second sub-plot 
hist(log10(MyDF$Prey.mass), xlab="log10(Prey Mass(g))", ylab="Count", col="lightgreen", border="pink", main="prey")

# OVERLAYING PLOTS 
hist(log10(MyDF$Predator.mass),
    xlab="log10(Body Mass (g))", ylab="Count",
    col = rgb(1,0,0,0.5), # Note 'rgb', fourth value = transparency 
    main = "Predator-prey size overlap", breaks = 12)
hist(log10(MyDF$Prey.mass), col = rgb(0,0,1,0.5), add = T, breaks=12) # Plot prey 
legend('topleft', c('Predators', 'Prey'), #Add legend 
    fill=c(rgb(1,0,0,0.5), rgb(0,0,1,0.5))) #Define legend colours

# BOXPLOTS
boxplot(log10(MyDF$Predator.mass), xlab="Location", ylab="log10(Predator Mass)", main="Predator mass")
boxplot(log(MyDF$Predator.mass) ~ MyDF$Location,
xlab = "Location", ylab = "Predator Mass", 
main = "Predator mass by location")

boxplot(log(MyDF$Predator.mass) ~ MyDF$Type.of.feeding.interaction,
    xlab = "Location", ylab = "Predator Mass", 
    main = "Predator mass by feeding interaction type")

# COMBINING PLOT TYPES 
#c(bottom, left, top, right)
par(fig=c(0,0.8,0,0.8)) # specify figure size as proportion 
plot(log(MyDF$Predator.mass), log(MyDF$Prey.mass), xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") # Add labels
par(fig=c(0,0.8,0.4,1), new = TRUE)
boxplot(log(MyDF$Predator.mass), horizontal = TRUE, axes= FALSE)
par(fig=c(0.55,1,0,0.8), new=TRUE)
boxplot(log(MyDF$Prey.mass), axes=FALSE)
mtext("Fancy Predator-Prey scatterplot", side=3, outer=TRUE, line= -3)

# SAVING YOUR GRAPHICS 
pdf("../results/Pred_Prey_Overlay.pdf", # Open blank pdf page using relative path
    11.7, 8.3) # These numbers are page dimensions in inches
hist(log(MyDF$Predator.mass),
xlab="Body Mass (g)", ylab = "Count", col = rgb(1,0,0,0.5), main="Predator-Prey Size Overlap")
hist(log(MyDF$Prey.mass), # Plot prey weights
    col = rgb(0, 0, 1, 0.5), 
    add = T)  # Add to same plot = TRUE
legend('topleft',c('Predators','Prey'), # Add legend
    fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) 
graphics.off(); #you can also use dev.off() 


## BEAUTIFUL GRAPHICS IN R
require(ggplot2)

# SCATTERPLOTS
qplot(Prey.mass, Predator.mass, data=MyDF) #qplot for quick plots
qplot(log(Prey.mass), log(Predator.mass), data = MyDF)
#Colour by feeding interaction 
qplot(log(Prey.mass), log(Predator.mass), data=MyDF, colour = Type.of.feeding.interaction, asp=1)
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, shape = Type.of.feeding.interaction, asp = 1)

#Aesthetic mappings 
qplot(log(Prey.mass), log(Predator.mass),
    data=MyDF, colour = I("red")) # Set to real red

qplot(log(Prey.mass), log(Predator.mass), data=MyDF, size=3) #ggplot size mapping 
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, shape= I(3))

#Setting transparency 
qplot(log(Prey.mass), log(Predator.mass), data=MyDF, colour = Type.of.feeding.interaction, alpha=I(.5))

#Adding smoothers and regression lines 
qplot(log(Prey.mass), log(Predator.mass), data=MyDF, geom=c("point", "smooth"))

qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth")) + geom_smooth(method = "lm")

qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth"),
    colour = Type.of.feeding.interaction) + geom_smooth(method="lm")

qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth"),
    colour = Type.of.feeding.interaction) + geom_smooth(method = "lm",fullrange = TRUE)

qplot(Type.of.feeding.interaction, log(Prey.mass/Predator.mass), data=MyDF)

qplot(Type.of.feeding.interaction, log(Prey.mass/Predator.mass), data=MyDF, geom="jitter")

#Boxplots
qplot(Type.of.feeding.interaction, log(Prey.mass/Predator.mass), data=MyDF, geom="boxplot")

#Histograms and density plots 
qplot(log(Prey.mass/Predator.mass), data=MyDF, geom= "histogram",
    fill = Type.of.feeding.interaction)
    #Define the binwidths in units of x axis 
qplot(log(Prey.mass/Predator.mass), data=MyDF, geom = "histogram",
    fill = Type.of.feeding.interaction, binwidth=1)

qplot(log(Prey.mass/Predator.mass), data=MyDF, geom='density',
    fill = Type.of.feeding.interaction,
    alpha = I(0.5)) # Density plot, transparent 

#Using colour instead of fill only draws the curve outline 
qplot(log(Prey.mass/Predator.mass), data=MyDF, geom="density",
    colour = Type.of.feeding.interaction)

# Multi-faceted plots 
qplot(log(Prey.mass/Predator.mass), facets=Type.of.feeding.interaction~.,
    data = MyDF, geom="density") 
qplot(log(Prey.mass/Predator.mass), facets = .~ Type.of.feeding.interaction, 
    data=MyDF, geom="density")
    # (~.) tells whether faceting by row or column
        # facets = XXX~. (row)
        # column = .~XXX (column)

#Logarithmic axes
qplot(Prey.mass, Predator.mass, data = MyDF, log="xy")

#Plot annotations 
qplot(Prey.mass, Predator.mass, data=MyDF, log="xy",
    main = "Relation between predator and prey mass", #title 
    xlab = "log(Prey mass) (g)", #labels 
    ylab = "log(Predator mass) (g)") + theme_bw()

# SAVING YOUR PLOTS
pdf("../results/MyFirst-ggplot2-Figure.pdf")
print(qplot(Prey.mass, Predator.mass, data = MyDF,log="xy",
    main = "Relation between predator and prey mass", 
    xlab = "log(Prey mass) (g)", 
    ylab = "log(Predator mass) (g)") + theme_bw())
dev.off()

# The GEOM argument 
#load the data
MyDF <- as.data.frame(read.csv("../data/EcolArchives-E089-51-D1.csv"))

#barplot
qplot(Predator.lifestage, data = MyDF, geom = "bar")

#boxplot
qplot(Predator.lifestage, log(Prey.mass), data=MyDF, geom = "boxplot")

#violin plot
qplot(Predator.lifestage, log(Prey.mass), data=MyDF, geom = "violin")

#density
qplot(log(Predator.mass), data=MyDF, geom = "density")

#histogram 
qplot(log(Predator.mass), data = MyDF, geom = "histogram")

#scatterplot
qplot(log(Predator.mass), log(Prey.mass), data=MyDF, geom = "point")

#smooth 
qplot(log(Predator.mass), log(Prey.mass), data=MyDF, geom = "smooth")
qplot(log(Predator.mass), log(Prey.mass), data=MyDF, geom="smooth", method="lm")

## Advanced plotting: ggplot 
p <- ggplot(MyDF, aes(x = log(Predator.mass),
    y = log(Prey.mass),
    colour= Type.of.feeding.interaction))
p + geom_point()
q <- p + 
    geom_point(size=I(2), shape=I(10)) +
    theme_bw() + #make the background white
    theme(aspect.ratio=1) # make the plot square
q
q + theme(legend.position = "none") + theme(aspect.ratio=1) # remove legend
p <- ggplot(MyDF, aes(x=log(Prey.mass/Predator.mass), fill=Type.of.feeding.interaction)) + geom_density(alpha=0.5)
p
#create a mutlifaceted plot 
p <- ggplot(MyDF, aes(x=log(Prey.mass/Predator.mass), fill=Type.of.feeding.interaction)) + geom_density() + 
    facet_wrap(.~Type.of.feeding.interaction, scales="free") # allow data-specific axis limits using scales=free argument
p   #N.B. can also free up the x or y scales 

p <- ggplot(MyDF, aes(x=log(Prey.mass/Predator.mass))) + geom_density() + facet_wrap(.~Location, scales="free")
p

p <- ggplot(MyDF, aes(x = log(Prey.mass), y = log(Predator.mass))) +  geom_point() + facet_wrap( .~ Location, scales = "free")
p
#combine categories to create a big plot 
p <- ggplot(MyDF, aes(x = log(Prey.mass), y = log(Predator.mass))) +  geom_point() + facet_wrap( .~ Location + Type.of.feeding.interaction, scales = "free")
p
    # can cange the order of combination 
p <- ggplot(MyDF, aes(x = log(Prey.mass), y = log(Predator.mass))) +  geom_point() + facet_wrap( .~ Type.of.feeding.interaction + Location, scales = "free")
p

## SOME USEFUL GGPLOT EXAMPLES 
# Plotting a matrix 
require(reshape2)

GenerateMatrix <- function(N){
    M <- matrix(runif(N*N), N, N)
    return(M)
}
M <- GenerateMatrix(10)
Melt <- melt(M)

p <- ggplot(Melt, aes(Var1, Var2, fill=value)) + geom_tile()+ theme(aspect.ratio=1)
p
p + geom_tile(colour="black") + theme(aspect.ratio = 1, legend.position="none")

p + theme(legend.position="none", # remove all the elements 
    panel.background=element_blank(),
    axis.ticks=element_blank(),
    panel.grid.major=element_blank(),
    panel.grid.minor=element_blank(),
    axis.text.x=element_blank(),
    axis.title.x=element_blank(), 
    axis.text.y=element_blank(),
    axis.title.y=element_blank())

p + scale_fill_continuous(low="yellow", high="darkgreen")
p + scale_fill_gradient2()
p + scale_fill_gradientn(colours=grey.colors(10))

# Annotating plots 
a <- read.table("../data/Results.txt", header = TRUE)
head(a)


# Mathematical display 
x <- seq(0, 100, by = 0.1)
y <- -4. + 0.25 * x + 
    rnorm(length(x), mean = 0., sd = 2.5)

# put in a data frame
my_data <- data.frame(x = x, y = y)
# perform a linear regression 
my_lm <- summary(lm(y ~ x, data = my_data))

# plot the data
p <- ggplot(my_data, aes(x=x, y=y, colour = abs(my_lm$residual))) +
    geom_point() +
    scale_colour_gradient(low="black", high="red") +
    theme(legend.position = "none") +
    scale_x_continuous(expression(alpha^2 * pi / beta *sqrt(Theta)))

# add the regression line 
p <- p + geom_abline(intercept = my_lm$coefficients[1][1],
    slope = my_lm$coefficients[2][1],
    colour = "red")
# throw some maths on the plot 
p <- p + geom_text(aes(x=60, y=0,
    label = "sqrt(alpha) * 2* pi"),
    parse = TRUE, size = 6, 
    colour = "blue")
p

## ggthemes 
install.packages("ggthemes")

library(ggthemes)
p <- ggplot(MyDF, aes(x = log(Predator.mass), y = log(Prey.mass),
                    colour = Type.of.feeding.interaction)) + 
                    geom_point(size=I(2), shape=I(10)) + theme_bw()

p + geom_rangeframe() + # fine tune geom to Tufte's range frame
    theme_tufte() #and theme to Tufte's minimal ink theme 