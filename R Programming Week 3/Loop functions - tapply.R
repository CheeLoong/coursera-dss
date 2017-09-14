# Loop functions - tapply

# tapply
## tapply is used to apply a function over subsets of vector
str(tapply)
## X is a vector(numerical vector), INDEX is a factor or a list of factors (i.e. qualitative vector), FUN is a function, ... contains all other arguments to be passed, simplify indicates whether result should be simplified

## Example 1: Getting group means
x <- c(rnorm(10), runif(10), rnorm(10,1))
x
f <- gl(3,10) # create factor variable
f
tapply(x,f,mean)
tapply(x,f,mean,simplify=FALSE) # get result as a list when simplify is set to FALSE

## Example 2: Getting group ranges
tapply(x,f,range)