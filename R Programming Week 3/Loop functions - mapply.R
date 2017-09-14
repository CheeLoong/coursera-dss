# Loop functions - mapply

# mapply
## mapply is a multivariate apply of sorts which applies a function in paraller over a set of arguments
str(mapply)
## FUN is a function to apply, ... contains arguments to apply over, MoreArgs i a list of other arguments to FUN, SIMPLIFY indicates whether the result should be simplified

## Example 1: its tedious to type list(rep(1,4), rep(2,3), rep(3,2), rep(4,1)), instead type
mapply(rep, 1:4, 4:1) # rep is the repeat function

## Example 2: Vectorizing a function
noise <- function(n, mean, sd) {
        rnorm(n, mean, sd)
}
noise(5,1,2)
noise(1:5, 1:5, 2) # doesn't work as intended when passed on vector of arguments
mapply(noise, 1:5, 1:5, 2)
## Which is the same as 
list(noise(1,1,2), noise(2,2,2), noise(3,3,2), noise(4,4,2), noise(5,5,2))
