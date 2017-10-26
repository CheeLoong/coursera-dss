# Bootstrapping

## Consider a dataset
library(UsingR)
data(father.son)
x <- father.son$sheight
n <- length(x)
B <- 10000
resamples <- matrix(sample(x, n * B, replace = TRUE), B, n)
resampledMedians <- apply(resamples, 1, median)

## A plot of the histrogram of the resamples
g = ggplot(data.frame(x = resampledMedians), aes(x = x)) 
g = g + geom_density(size = 2, fill = "red")
#g = g + geom_histogram(alpha = .20, binwidth=.3, colour = "black", fill = "blue", aes(y = ..density..)) 
g = g + geom_vline(xintercept = median(x), size = 2)
g

## Example Code
B <- 10000
resamples <- matrix(sample(x, n * B, replace = TRUE), B, n)
medians <- apply(resamples, 1, median)
sd(medians) # Estimated Standard error of the median
quantile(medians, c(.025, .975)) # Confidence interval of the median

## Histogram of bootstrap resamples
g = ggplot(data.frame(medians = medians), aes(x = medians))
g = g + geom_histogram(color = "black", fill = "lightblue", binwidth = 0.05)
g # Estimate of the sampling distribution of the median



