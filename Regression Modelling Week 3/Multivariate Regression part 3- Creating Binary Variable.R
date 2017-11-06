# Multivariate Regression Examples part 3

## Recall the swiss data set
library(datasets); data(swiss)
head(swiss)
hist(swiss$Catholic)

## Create a binary variable
library(dplyr)
swiss = mutate(swiss, CatholicBin = 1 * (Catholic > 50))
head(swiss)

## Plot the data
g = ggplot(swiss, aes(x = Agriculture, y = Fertility, colour = factor(CatholicBin)))
g = g + geom_point(size = 6, colour = "black") + geom_point(size = 4)
g = g + xlab("% in Agriculture") + ylab("Fertility")
g

