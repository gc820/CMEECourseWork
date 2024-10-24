#!/usr/bin/env Rscript

## If statements ##

a <- TRUE 
if (a == TRUE) {
    print("a is TRUE")
} else {
    print("a is FALSE")
}

z <- runif(1) # Generate a uniformly distibuted random number
if (z <= 0.5) {
    print ("Less than a half")
    }