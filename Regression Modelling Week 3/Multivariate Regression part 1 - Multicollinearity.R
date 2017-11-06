# Multivariable Regression Examples

## Pairwise scatterplot of the data
library(datasets); data(swiss); require(stats); require(graphics)
pairs(swiss, panel = panel.smooth, main = "Swiss data", col = 3 + (swiss$Catholic > 50))

## Multiple Linear Regression (Agriculture is negatively related to Y)
summary(lm(Fertility ~ . , data = swiss))$coefficients
pt(-2.448, df = 41) * 2 ## p-value of Agriculture

## Simple Linear Regression (Agriculture is positively related to Y)
summary(lm(Fertility ~ Agriculture, data = swiss))$coefficients

## Simulation - Adjustment can reverse sign of an effect
n <- 100; x2 <- 1 : n; x1 <- .01 * x2 + runif(n, -.1, .1); y = -x1 + x2 + rnorm(n, sd = .01)
summary(lm(y ~ x1))$coef

summary(lm(y ~ x1 + x2))$coef

## Unnecessary Variable
z <- swiss$Agriculture + swiss$Education
lm(Fertility ~ . + z, data = swiss)

