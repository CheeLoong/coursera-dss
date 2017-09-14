# Simulation - Generating Random Numbers

## Functions for prob dist in R
#(1) rnorm: generate random normal variates with a given mean and S.D.
#(2) dnorm: evaluate the normal prob density (with a given mean/S.D) at a point(or vector of points)
#(3) pnorm: evaluate the cumulative distribution function for a Normal distribution
#(4) rpois: generate random Poisson variates with a given rate

## Probability distribution functions usually have four functions associated with them. The functions are prefixed with a
# d for density
# r for random number generation
# p for cumulative distribution
# q for quantile function

## Working with the Normal dist requires using these four functions
?dnorm
?pnorm
?qnorm
?rnorm

## Generating Random Numbers:
x <- rnorm(10)
x

x <- rnorm(10,20,2)
x
summary(x)
str(x)

## Setting the random number seed with set.seed ensures reproducibility
set.seed(1)
rnorm(5)
rnorm(5)

set.seed(1)
rnorm(5)
## Always set the random number seed when conducting a simulation!

## Generating Poisson data
rpois(10,1)
rpois(10,2)
rpois(10,20)

ppois(2,2) # Cumulative distribution, Pr(x <= 2)
ppois(4,2) # Pr(x <= 4)
ppois(6,2) # Pr(x <= 6)
