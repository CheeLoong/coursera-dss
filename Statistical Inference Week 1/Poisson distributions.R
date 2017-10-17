# Poisson distributions

# Example (Poisson distribution)
ppois(3, lambda = 2.5 * 4)

# Example (Poisson approximation to the binomial)
pbinom(2, size = 500, prob = 0.01)
ppois(2, lambda = 500 * 0.01)
