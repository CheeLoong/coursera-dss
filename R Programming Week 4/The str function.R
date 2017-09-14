# The str function
## compactly display the internal structure of an R object, it is especially well suited to comapctly display large lists (possibly nested)

## Example 1:
str(str)
str(lm)
str(ls)

## Example 2:
x <- rnorm(100,2,4)
summary(x)
str(x)

## Example 3:
f <- gl(40, 10)
str(f)
summary(f)

## Example 4:
library(datasets)
head(airquality)
str(airquality)

## Example 5:
m <- matrix(rnorm(100), 10, 10)
str(m)
m[, 1]

## Example 6:
s <- split(airquality, airquality$Month)
str(s)
