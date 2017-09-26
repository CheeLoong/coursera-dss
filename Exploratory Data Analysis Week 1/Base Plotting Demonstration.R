# Base Plotting Demonstration

x <- rnorm(100)
hist(x)

y <- rnorm(100)
plot(x, y)

# margin
par("mar")
par(mar = c(2, 2, 2, 2))
plot(x, y)
par(mar = c(4, 4, 2, 2))
plot(x, y)

# plotting symbol
plot(x, y, pch = 20)
plot(x, y, pch = 19)
plot(x, y, pch = 4)
plot(x, y, pch = 3)

# Adding titles & texts
title("Scatterplot")
text(-2, -2, "Label")
legend("topleft", legend = "Data", pch = 20)
fit <- lm(y ~ x)
abline(fit)
abline(fit, lwd = 3)
abline(fit, lwd = 3, col = "blue")

# Alternatively,
plot(x, y, xlab = "Weight", ylab = "Height", main = "Scatterplot", pch = 20 )
legend("topright", legend = "Data", pch = 20)
abline(fit, lwd = 3, col = "red")

# Multiple plotting
z <- rpois(100, 2)
par(mfrow = c(2, 1))
plot(x, y, pch = 20)
par(mar = c(1, 1, 1, 1)) # This corrects figure margins too large error
plot(x, y, pch = 20)
plot(x, z, pch = 19)
par(mar = c(2, 2, 1, 1))
plot(x, y, pch = 20)
plot(x, z, pch = 20)
par(mar = c(4, 4, 2, 2))
plot(x, y, pch = 20)
plot(x, z, pch = 20)    


# mfrow & mfcol
par(mfrow = c(2, 2)) # draws plot based on the row-order
plot(x, y)
plot(x, z)
plot(z, x)
plot(y, x)

par(mfcol = c(2, 2)) # draws plot based on the col-order
plot(x, y)
plot(x, z)
plot(z, x)
plot(y, x)

# Use Points function separate two different group 
par(mfrow = c(1, 1))
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2, 50, labels = c("Male", "Female"))
str(g)
plot(x, y) # can't tell which data point is male/female
plot(x, y, type ="n") # make the plot, but don't put data in it
points(x[g == "Male"], y[g == "Male"], col = "green") # adding male data point
points(x[g == "Female"], y[g == "Female"], col = "blue")
points(x[g == "Female"], y[g == "Female"], col = "blue", pch = 19)
