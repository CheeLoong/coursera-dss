# Simulation - Simulating a Linear Model

## Generating Random Numbers From a Linear Model
## where e ~ N(0,2^2). Assume x ~ N(0,1^2), B_0 = 0.5, B_1 = 2
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e
summary(y)
plot(x,y)

## What if x is a binary?
set.seed(10)
x <- rbinom(100, 1, 0.5) # x is binary
e <- rnorm(100, 0, 2) # error term
y <- 0.5 + 2*x + e
summary(y)
plot(x,y) # shows x variable is binary and y variable is continuous

## Generating Random Numbers From a Generalized Linear Model
## Suppose we want to simulate from a Poisson model where Y ~ Poisson(u)
## log u = B_0 + B_1*x, B_0 = 0.5, B_1 = 0.3
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x #generate linear predictor log of mu
y <- rpois(100, exp(log.mu)) #to get the mean of Poisson random variable, we need to exp(log.mu)
summary(y)
plot(x,y)
