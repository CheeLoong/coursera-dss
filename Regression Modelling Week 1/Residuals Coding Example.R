# Residuals Coding Example

## Code
data(diamond)
y <- diamond$price; x <- diamond$carat; n <- length(y)
fit <- lm(y ~ x)
e <- resid(fit) ### residual plot of the linear regression
yhat <- predict(fit)
max(abs(e -(y - yhat))) ### highest DIFFERENCE between residual values calculated in two different ways
max(abs(e - (y - coef(fit)[1] - coef(fit)[2] * x)))

sum(e) # This has to be 0
sum(e * x) # This also has to be 0

## Residuals are the signed length of the red lines
plot(diamond$carat, diamond$price,  
     xlab = "Mass (carats)", 
     ylab = "Price (SIN $)", 
     bg = "lightblue", 
     col = "black", cex = 2, pch = 21,frame = FALSE)
abline(fit, lwd = 2)
for (i in 1 : n) 
        lines(c(x[i], x[i]), c(y[i], yhat[i]), col = "red" , lwd = 2)

## Residuals versus X (Easier to see the residuals for each x)
plot(x, e,  
     xlab = "Mass (carats)", 
     ylab = "Residuals (SIN $)", 
     bg = "lightblue", 
     col = "black", cex = 2, pch = 21,frame = FALSE)
abline(h = 0, lwd = 2)
for (i in 1 : n) 
        lines(c(x[i], x[i]), c(e[i], 0), col = "red" , lwd = 2)

## Non-linear data (Demonstrate use of residual plot)
x = runif(100, -3, 3); y = x + sin(x) + rnorm(100, sd = .2); 
library(ggplot2)
g = ggplot(data.frame(x = x, y = y), aes(x = x, y = y))
g = g + geom_smooth(method = "lm", colour = "black")
g = g + geom_point(size = 7, colour = "black", alpha = 0.4)
g = g + geom_point(size = 5, colour = "red", alpha = 0.4)
g

## Non-linear Residual plot
g = ggplot(data.frame(x = x, y = resid(lm(y ~ x))), aes(x = x, y = y))
g = g + geom_hline(yintercept = 0, size = 2); 
g = g + geom_point(size = 7, colour = "black", alpha = 0.4)
g = g + geom_point(size = 5, colour = "red", alpha = 0.4)
g = g + xlab("X") + ylab("Residual")
g

## Heteroskedastic data (can't see the trend)
x <- runif(100, 0, 6); y <- x + rnorm(100,  mean = 0, sd = .001 * x); 
g = ggplot(data.frame(x = x, y = y), aes(x = x, y = y))
g = g + geom_smooth(method = "lm", colour = "black")
g = g + geom_point(size = 7, colour = "black", alpha = 0.4)
g = g + geom_point(size = 5, colour = "red", alpha = 0.4)
g

## Getting rid of the blank space can be helpful
g = ggplot(data.frame(x = x, y = resid(lm(y ~ x))), aes(x = x, y = y))
g = g + geom_hline(yintercept = 0, size = 2); 
g = g + geom_point(size = 7, colour = "black", alpha = 0.4)
g = g + geom_point(size = 5, colour = "red", alpha = 0.4)
g = g + xlab("X") + ylab("Residual")
g

## Diamond data residual plot
diamond$e <- resid(lm(price ~ carat, data = diamond))
g = ggplot(diamond, aes(x = carat, y = e))
g = g + xlab("Mass (carats)")
g = g + ylab("Residual price (SIN $)")
g = g + geom_hline(yintercept = 0, size = 2)
g = g + geom_point(size = 7, colour = "black", alpha=0.5)
g = g + geom_point(size = 5, colour = "blue", alpha=0.2)
g

## Diamond data residual plot  
e = c(resid(lm(price ~ 1, data = diamond)), # residuals variation around the average price
      resid(lm(price ~ carat, data = diamond))) # residuals variation around the regression line
fit = factor(c(rep("Itc", nrow(diamond)), # create factor variable that labels the set of residuals, label the intercept-only model residuals 
               rep("Itc, slope", nrow(diamond)))) # label the intercept and slope residuals
g = ggplot(data.frame(e = e, fit = fit), aes(y = e, x = fit, fill = fit))
g = g + geom_dotplot(binaxis = "y", size = 2, stackdir = "center", binwidth = 20)
g = g + xlab("Fitting approach")
g = g + ylab("Residual price")
g
