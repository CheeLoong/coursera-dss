# Loop functions - lapply & sapply 

# lapply
## Takes 3 arguments: (1) a list, (2) a function, FUN (3) other arguments via its ... argument
## If x is not a list, it will be coerced into a list using as.list.
lapply

## lapply always return a list, regardless of the class of the input
### Example 1
x <- list(a = 1:5, b = rnorm(10))
lapply(x,mean)

### Example 2
x <- list(a = 1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
lapply(x,mean)

### Example 3
x <- 1:4
lapply(x, runif) # this is a shortcut to runif(1)..runif(4)

### Example 4
x <- 1:4 
lapply(x, runif, min=0, max=10)

## lapply and friends make heavy use of anonymous functions

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x

## An anonymous function for extracting first column of each matrix.

lapply(x, function(elt) elt[,1]) # this function does not exist except within the context of lapply, this is an anonymous function

# sapply 
## sapply will try to simplify the result of lapply if possible.
x <- list(a = 1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
lapply(x, mean)
sapply(x, mean)
mean(x) # does not work because mean is not meant to be applied to lists
