# Probability Densitiy Funciton
## Example
x <- c(-0.5, 0, 1, 1, 1.5)
y <- c(0, 0, 2, 0, 0)
plot(x, y, lwd = 3, frame = FALSE, type = "l")

## Example continued - What is the prob that 75% or fewer of calls get addressed?
1.5 * 0.75/2
pbeta(0.75, 2, 1) # beta distribution


# CDF & Survival Function
## Example - What are the survival function and CDF from the density considered before?
pbeta(c(0.4, 0.5, 0.6), 2, 1)

# Quantiles 
qbeta(0.5, 2, 1)
