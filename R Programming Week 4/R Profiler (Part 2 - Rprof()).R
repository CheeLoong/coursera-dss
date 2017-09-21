# R Profiler (Part 2) - Using Rprof()

## The R Profiler
# The summaryRprof() function summarizes the output from Rprof() (otherwise it's not readable)
# (warning: DO NOT use system.time() and Rprof() together)
# There are 2 methods for normalizing the data:
# (1) "by.total" divides the time spend in each function by the total run time
# (2) "by.self" does the same but first subtracts out time spent in functions above in the call stack (this gives a more accurate picture of which function consuming more time)

Rprof(tmp <- "~/Desktop/coursera-dss/R Programming Week 4/tmp.cmd" )

x <- function() {
        for (i in 1:1000000){
        a = t(7)
        }
        return(a)
}

x()

Rprof(NULL)
summaryRprof(tmp)
