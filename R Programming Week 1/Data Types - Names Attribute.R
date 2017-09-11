# Data Types - Names Attribute

# Names
## R objects can also have names, which is very useful for writing readable codes and self-describing objects.

x <- 1:3 
names(x) # by default it has no name
names(x) <- c("foo","bar","norf")
x
names(x)

## List can also have names
x <- list(a = 1, b = 2, c = 3)
x

## Matrices can have names
m <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <- list(c("a","b"), c("c","d"))
m
