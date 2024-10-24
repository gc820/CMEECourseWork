#!/usr/bin/env Rscript

SomeOperation <- function(v) { # Takses v as input 
    if (sum(v) > 0) { # If sum of v is >0 (both + and -)
        return (v * 100) # Multiply by 100 
    } else {
        return (v) 
    }
}

M <- matrix(rnorm(100), 10, 10)
print (apply(M, 1, SomeOperation))