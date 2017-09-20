# Simulation - Random Sampling

## Random Sampling
## The sample function draws randomly from a specified set of (scalar) objects allowing you to sample from arbitrary distributions.
set.seed(1)
sample(1:10, 4)
sample(1:10, 4) # sampling without replacement
sample(letters, 5)
sample(1:10) # permutation
sample(1:10)
sample(1:10, replace = TRUE) # sampling w/ replacement

