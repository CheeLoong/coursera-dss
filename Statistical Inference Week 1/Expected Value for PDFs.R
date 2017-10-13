# Expected Value for PDFs


## Simulation experiment -Simulating normals with mean 0 and variance 1 versus averages of 10 normals from the same population
library(ggplot2)
nosim <- 10000; n <- 10
dat <- data.frame(
        x = c(rnorm(nosim), apply(matrix(rnorm(nosim * n), nosim), 1, mean)),
        what = factor(rep(c("Obs", "Mean"), c(nosim, nosim))) 
)
ggplot(dat, aes(x = x, fill = what)) + geom_density(size = 2, alpha = .2); 

## Averages of x die rolls
dat <- data.frame(
        x = c(sample(1 : 6, nosim, replace = TRUE),
              apply(matrix(sample(1 : 6, nosim * 2, replace = TRUE), 
                           nosim), 1, mean),
              apply(matrix(sample(1 : 6, nosim * 3, replace = TRUE), 
                           nosim), 1, mean),
              apply(matrix(sample(1 : 6, nosim * 4, replace = TRUE), 
                           nosim), 1, mean)
        ),
        size = factor(rep(1 : 4, rep(nosim, 4))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth=.25, colour = "black") 
g + facet_grid(. ~ size)


## Averages of x coin flips

dat <- data.frame(
        x = c(sample(0 : 1, nosim, replace = TRUE),
              apply(matrix(sample(0 : 1, nosim * 10, replace = TRUE), 
                           nosim), 1, mean),
              apply(matrix(sample(0 : 1, nosim * 20, replace = TRUE), 
                           nosim), 1, mean),
              apply(matrix(sample(0 : 1, nosim * 30, replace = TRUE), 
                           nosim), 1, mean)
        ),
        size = factor(rep(c(1, 10, 20, 30), rep(nosim, 4))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth = 1 / 12, colour = "black"); 
g + facet_grid(. ~ size)
