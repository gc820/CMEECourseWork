#!/usr/bin/env Rscript

result <- lapply(1:15, function(i) try(doit(popn), FALSE))
class(result)
result

result <- vector("list", 15) #Preallocate/Initialize
for(i in 1:15) {
    result[[i]] <- try(doit(popn), FALSE)
    }