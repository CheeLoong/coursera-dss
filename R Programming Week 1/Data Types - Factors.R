# Data Types - Factors

# Factors
## Factors are used to represent categorical data, can be unordered or ordered. Can think it of a factor as an integer vector where each integer has a label.

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x) #gives frequency of the levels
unclass(x) #bring it to an integer vector by unclass-ing.
attr(x,"levels")

## The order of the levels can be set using the levels argument to factor(). This can be important in linear modelling because first level is used as the baseline level.

x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes","no"))
x
