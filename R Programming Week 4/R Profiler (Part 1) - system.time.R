# R Profiler (Part 1)
## Why is My Code So Slow?
# - Profiling is a systematic way to examine how much time is spend in different parts of a program
# - Often code runs fine once, but what if there is a loop for 1,000 iterations?
# - Profiling is a way to know if the system is fast enough.

## General Principles of Optimization 
# - Design first, then optimize
# - Remember: Premature optimization is the root of all evil
# - Measure (collect data), don't guess

## Using system.time()

# Elapsed time > User time
system.time(readline("http://www.jhsph.edu")) # running code is fast, but data transfer takes some time
# user time: time charged to the CPU(s) for this expression
# elapsed time: "wall clock" time

# Elapsed time < User time (supposedly)
hilbert <- function(n) {
        i <- 1:n
        1 / outer(i - 1, i, "+")
}

x <- hilbert(1000)
system.time(svd(x))

## Timing Longer Expressions
system.time({
        n <- 1000
        r <- numeric(n)
        for (i in 1:n){
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})
