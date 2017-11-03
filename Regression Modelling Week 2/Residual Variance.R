# Residual Variance

## Diamond example
library(UsingR)
data(diamond)
y <- diamond$price; x <- diamond$carat; n <- length(y)
fit <- lm(y ~ x)

summary(fit)$sigma
sqrt(sum(resid(fit)^2) / (n - 2))
