# Asmptotics and Confidence Intervals


## Give a confidence interval for the average height of sons
library(UsingR);data(father.son); x <- father.son$sheight
(mean(x) + c(-1, 1) * qnorm(.975) * sd(x) / sqrt(length(x))) / 12




## Example Wald Test
0.56 + c(-1, 1) * qnorm(.975) * sqrt(0.56 * 0.44/ 100)

# Alternatively, can use binomial interval
binom.test(56, 100)$conf.int

## Simulation
n <- 20; pvals <- seq(.1, .9, by = .05); nosim <- 1000
coverage <- sapply(pvals, function(p){
        phats <- rbinom(nosim, prob = p, size = n) / n
        ll <- phats - qnorm(.975) * sqrt(phats * (1 - phats) / n)
        ul <- phats + qnorm(.975) * sqrt(phats * (1 - phats) / n)
        mean(ll < p & ul > p)
})

# This simulations in this topic is ridiculously hard, therefore just understand and memorise the concept for the time being.

