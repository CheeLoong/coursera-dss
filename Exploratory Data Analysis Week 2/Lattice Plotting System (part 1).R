# Lattice Plotting System (part 1)

# Simple Lattice Plot
# Example 1: Simple Scatterplot
library(lattice)
library(datasets)

xyplot(Ozone ~ Wind, data = airquality)

# Example 2
library(datasets)
library(lattice)

airquality <- transform(airquality, Month = factor(Month)) # Convert 'Month' to a factor variable
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1)) # single line to create multimensional plot

# Lattice Behaviour

p <- xyplot(Ozone ~ Wind, data = airquality) # nothing happens
print(p) # plot appears

xyplot(Ozone ~ Wind, data = airquality) # Plot appears
