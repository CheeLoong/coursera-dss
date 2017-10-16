# Variance Simulation Example

## Simulation experiment
### Simulating from a population with variance 1

library(ggplot2)
nosim <- 10000; 
dat <- data.frame(
        x = c(apply(matrix(rnorm(nosim * 10), nosim), 1, var),
              apply(matrix(rnorm(nosim * 20), nosim), 1, var),
              apply(matrix(rnorm(nosim * 30), nosim), 1, var)),
        n = factor(rep(c("10", "20", "30"), c(nosim, nosim, nosim))) 
)
ggplot(dat, aes(x = x, fill = n)) + geom_density(size = 2, alpha = .2) + geom_vline(xintercept = 1, size = 2) 


## Variances of x die rolls
dat <- data.frame(
        x = c(apply(matrix(sample(1 : 6, nosim * 10, replace = TRUE), 
                           nosim), 1, var),
              apply(matrix(sample(1 : 6, nosim * 20, replace = TRUE), 
                           nosim), 1, var),
              apply(matrix(sample(1 : 6, nosim * 30, replace = TRUE), 
                           nosim), 1, var)
        ),
        size = factor(rep(c(10, 20, 30), rep(nosim, 3))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth=.3, colour = "black") 
g <- g + geom_vline(xintercept = 2.92, size = 2)
g + facet_grid(. ~ size)

