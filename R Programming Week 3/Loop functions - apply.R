# Loop Functions - apply

# apply
## apply is used to evaluate a function (often an anonymous) over the margins of an array
str(apply)
## x is an array, MARGIN is an integer vector indicating which margins should be retained, FUN is a function to be applied, ... is for other arguments to be passed to FUN

## Example 1
x <- matrix(rnorm(200), 20, 10)
x
apply(x,2,mean) #keep the second dimension which is the column, taking the mean accross all the rows
apply(x,1,mean) # keep the first dimension which is the row

# col/row sums and means
## we have shortcuts

rowSums = apply(x,1,sum)
rowMeans = apply(x,1,mean)
colSums = apply(x,2,mean)
colMeans = apply(x,2,mean)

## Example 2: Quantiles of the rows of a matrix

x <- matrix(rnorm(200), 20, 10)
x
apply(x, 1, quantile, probs = c(0.25,0.75)) # Calcualte 25th percentile and 75th percentile

## Example 3: Average matrix in an array

a <- array(rnorm(2*2*10), c(2,2,10))
apply(a, c(1,2), mean)
## Alternatively,
rowMeans(a,dims=2)
