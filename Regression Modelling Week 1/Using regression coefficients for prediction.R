# Interpreting Coefficients Coding Example & Linear Regression Prediction

## Plot of the data
library(UsingR)
data(diamond)
library(ggplot2)
g = ggplot(diamond, aes(x = carat, y = price))
g = g + xlab("Mass (carats)")
g = g + ylab("Price (SIN $)")
g = g + geom_point(size = 7, colour = "black", alpha=0.5)
g = g + geom_point(size = 5, colour = "blue", alpha=0.2)
g = g + geom_smooth(method = "lm", colour = "black")
g

## Fitting the linear regression model
fit <- lm(price ~ carat, data = diamond)
fit
summary(fit)
coef(fit) 
### we estimated an expected 3721 SGD increase in price for every carat increase in mass of diamond, the intercept is the expected price of a 0 carat diamond (not interesting)

## Getting a more interpretable intercept
fit2 <- lm(price ~ I(carat - mean(carat)), data = diamond)
coef(fit2)
### thus $500.1 is the expected price for the average sized diamond of the data (0.2042 carats)
mean(diamond$carat)

## Changing scale (carat to 1/10 carat)
fit3 <- lm(price ~ I(carat * 10), data = diamond)
coef(fit3)

## Predicting the price of a diamond
newx <- c(0.16, 0.27, 0.34)
coef(fit)[1] + coef(fit)[2] * newx # manualling predicting price of new diamonds
predict(fit, newdata = data.frame(carat = newx)) # general prediction procedure

