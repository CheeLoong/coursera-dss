# Standard error of the mean simulations

## Simulation example (1)
nosim <- 1000
n <- 10
sd(apply(matrix(rnorm(nosim*n), nosim), 1, mean))
1 / sqrt(n)

## Simulation example (2)
nosim <- 1000
n <- 10
sd(apply(matrix(runif(nosim*n), nosim), 1, mean))
1 / sqrt(12*n)

## Simulation example (3)
nosim <- 1000
n <- 10
sd(apply(matrix(rpois(nosim*n, 4), nosim), 1, mean))
2/sqrt(n)

## Simulation example (4)
nosim <- 1000
n <- 10
sd(apply(matrix(sample(0:1, nosim*n, replace = TRUE), nosim), 1, mean))
1/(2* sqrt(n))
