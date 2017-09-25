# Plotting Systems in R

# Base Plot
library(datasets)
data(cars)
with(cars, plot(speed, dist))

# Lattice Plot
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

# ggplot2 System
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

# Summary
# Base: "artist's palette' model (add things 1 by 1)
# Lattice: Entire plot specified by one function
# ggplot2: Mixes elements of Base and Lattice
# note you cant use them interchangably