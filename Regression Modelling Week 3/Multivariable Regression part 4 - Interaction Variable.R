# Multivariable Regression part 4 - Interaction Variable

## From previous script (Multivariate Regression part 3)
## Create a binary variable
library(dplyr)
swiss = mutate(swiss, CatholicBin = 1 * (Catholic > 50))
head(swiss)

## Plot the data 
g = ggplot(swiss, aes(x = Agriculture, y = Fertility, colour = factor(CatholicBin)))
g = g + geom_point(size = 6, colour = "black") + geom_point(size = 4)
g = g + xlab("% in Agriculture") + ylab("Fertility")
g

## Fitting model with No effect of religion (Model 1)
summary(lm(Fertility ~ Agriculture, data = swiss))$coef

## The associated fitted line (Model 1)
fit = lm(Fertility ~ Agriculture, data = swiss)
g1 = g
g1 = g1 + geom_abline(intercept = coef(fit)[1], slope = coef(fit)[2], size = 2)
g1

## Fitting model with religion binary variable (Model 2)
summary(lm(Fertility ~ Agriculture + factor(CatholicBin), data = swiss))$coef

## The associated fitted line (Model 2)
fit = lm(Fertility ~ Agriculture + factor(CatholicBin), data = swiss)
g1 = g
g1 = g1 + geom_abline(intercept = coef(fit)[1], slope = coef(fit)[2], size = 2)
g1 = g1 + geom_abline(intercept = coef(fit)[1] + coef(fit)[3], slope = coef(fit)[2], size = 2)
g1

## Fitting model with interaction effect variable (Model 3)
summary(lm(Fertility ~ Agriculture * factor(CatholicBin), data = swiss))$coef

## The associated fitted line (Model 3)
fit = lm(Fertility ~ Agriculture * factor(CatholicBin), data = swiss)
g1 = g
g1 = g1 + geom_abline(intercept = coef(fit)[1], slope = coef(fit)[2], size = 2)
g1 = g1 + geom_abline(intercept = coef(fit)[1] + coef(fit)[3], slope = coef(fit)[2] + coef(fit)[4], size = 2)
g1




