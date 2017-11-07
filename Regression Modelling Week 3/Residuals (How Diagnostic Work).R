# Residuals (How Diagnostic work)


## Case 1 (Strong correlation between x and y because of the outlier)
n <- 100
x <- c(10, rnorm(n)); y <- c(10, c(rnorm(n)))
plot(x, y, frame = FALSE, cex = 2, pch = 21, bg = "lightblue", col = "black")
abline(lm(y ~ x)) 
cor(x,y) 

## Diagnostic values for Case 1
fit <- lm(y ~ x)
round(dfbetas(fit)[1 : 10, 2], 3) # First point (10, 10) has larger dfbetas compared to the remaining points (HIGH INFLUENCE)

round(hatvalues(fit)[1 : 10], 3) # First point (10, 10) has larger hatvalues compared to the remaining points (HIGH LEVERAGE)

## Case 2
x <- rnorm(n); y <- x + rnorm(n, sd = .3)
x <- c(5, x); y <- c(5, y)
plot(x, y, frame = FALSE, cex = 2, pch = 21, bg = "lightblue", col = "black")
fit2 <- lm(y ~ x)
abline(fit2)            

## Diagnostic Values for Case 2
round(dfbetas(fit2)[1 : 10, 2], 3) # First point appears to be larger but only slightly. (LOW INFLUENCE)

round(hatvalues(fit2)[1 : 10], 3) # First point has hat values that is much larger than the remaining points (HIGH LEVERAGE)

## Example described by Stefanski TAS 2007 Vol 61.
dat <- read.table('http://www4.stat.ncsu.edu/~stefanski/NSF_Supported/Hidden_Images/orly_owl_files/orly_owl_Lin_4p_5_flat.txt', header = FALSE)
pairs(dat) # Overplotting issue

## All P-values are significant, should be bother to do residual plot? 
summary(lm(V1 ~ . -1, data = dat))$coef

## P - values significant, O RLY?
fit <- lm(V1 ~ . - 1, data = dat); plot(predict(fit), resid(fit), pch = '.')

## Back to the Swiss data
data(swiss); par(mfrow = c(2, 2))
fit <- lm(Fertility ~ . , data = swiss); plot(fit)
