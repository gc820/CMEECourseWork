#!/usr/bin/env Rscript

# breaking out of loops
i <- 0 #Inisitaise i 
    while (i < Inf) {
        if (i ==10){
            break
        } else { # breal out fo the while loop!
            cat("i equals ", i, "\n")
            i <- i + 1 # Update i 
        }
    }