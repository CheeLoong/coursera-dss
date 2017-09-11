# Data Types - Matrices

# Matrices 
## Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector of length 2 (nrow, ncol)
m <- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)

## Matrices are constructed column-wise, so entries can be thought of starting in the "upper left" corner and running down the columns
m <- matrix(1:6, nrow=2, ncol=3)
m

## Matrices can also be created directly from vectors by adding a dimension attribute.

m <- 1:10
m
dim(m) <- c(2, 5)
m

#cbind-ing and rbing-ing
#Matrices can be created by column-binding or row-binding with cbind() and rbind()
x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)
