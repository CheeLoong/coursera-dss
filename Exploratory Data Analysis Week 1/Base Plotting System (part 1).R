# Base Plotting System (part 1)

# Simple Base Graphics: Histogram (1 Dimensional Plot)
library(datasets)
hist(airquality$Ozone) # draw a new plot

# Simple Base Graphics: Scatterplot
library(datasets)
with(airquality, plot(Wind, Ozone))

# Simple Base Graphics: Boxplot
library(datasets)
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

# Some important Base Graphics Parameters

# pch : the plotting symbol (default is open circle)
# lty : the line type (default is solid line), can be dashed, dotted, etc
# lwd : the line width, specified as an integer multiple
# col : the plotting colour; refer to colors()
# xlab : x-axis label
# ylab : y-axis label

# par() function is used to specify global graphics parameters that affect all plots in R session.
# las : the orientation of the axis labels on the plot
# bg : the background color
# mar : the margin size
# oma: the outer margin size (default is 0 for all sides)
# mfrow: number of plots per row, column (plots are filled row-wise)
# mfcol: number of plots per row, column (plots are filled column-wise)

# Default values for global graphics parameters
par("lty")
par("col")
par("pch")
par("bg")
par("mar") # each numbers each of the margin, from bottom to right side (clockwise direction)
par("mfrow") # default is 1 1, 1 row and 1 column
