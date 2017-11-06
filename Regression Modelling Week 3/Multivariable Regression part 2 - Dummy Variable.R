# Multivariable Regression Example - Dummy Variable 


## Plot Insect Sprays data
require(datasets); data(InsectSprays); require(stats); require(ggplot2)
g = ggplot(data = InsectSprays, aes(y = count, x = spray, fill  = spray))
g = g + geom_violin(colour = "black", size = 2)
g = g + xlab("Type of spray") + ylab("Insect count")
g

## Linear model fit, group A is the reference
summary(lm(count ~ spray, data = InsectSprays))$coef

## Hard coding the dummy variables (pick our own reference group)
summary(lm(count ~ 
                   I(1 * (spray == 'B')) + I(1 * (spray == 'C')) + 
                   I(1 * (spray == 'D')) + I(1 * (spray == 'E')) +
                   I(1 * (spray == 'F'))
           , data = InsectSprays))$coef

## What if we include all 6? (R autofix the redundant variable)
summary(lm(count ~ 
                   I(1 * (spray == 'B')) + I(1 * (spray == 'C')) +  
                   I(1 * (spray == 'D')) + I(1 * (spray == 'E')) +
                   I(1 * (spray == 'F')) + I(1 * (spray == 'A')), data = InsectSprays))$coef

## What if we omit the intercept? (Coefficient interpretation changes)
summary(lm(count ~ spray - 1, data = InsectSprays))$coef
library(dplyr)
summarise(group_by(InsectSprays, spray), mn = mean(count))
### without the intercept setting, the p-value is testing whether spray (A ~ F) are individually statistically significant in killing bugs.
### with the intercept setting, the p-value is testing whether spray A is different from other sprays.

## Reordering the levels
spray2 <- relevel(InsectSprays$spray, "C")
summary(lm(count ~ spray2, data = InsectSprays))$coef
