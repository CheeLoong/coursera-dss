# Loop functions - split
## split is not a loop function but is very handy that can be used in conjuction with functions like lapply and sapply.

# split
## split takes a vector of other objects and splits it into groups determined by factor or a list of factors
str(split)
## x is a vector (or list) or data frame, f is a factor or a list of factors, drop indicates whether empty facours levels should be dropped.

## Example 1: Using split, then followed by lapply
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
split(x,f) #split x into categories that are identified by f.
## we can apply lapply after split
l <- lapply(split(x,f), mean)
## this is the same as
t <- tapply(x,f,mean)

## Example 2: Splitting a Data Frame:
library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) # result in matrix instead of list
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

## Example 3: Splitting on more than one level
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
f1
f2
interaction(f1,f2)
str(split(x,list(f1,f2)))
str(split(x,list(f1,f2), drop=TRUE))
