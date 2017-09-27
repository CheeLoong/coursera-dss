# ggplot2 (part 2)

# Basic Components of a ggplot2 Plot
# A data frame
# aesthetic mappings: how data are mapped to color, size
# geoms: geometric object like points, lines, shapes.
# facets: for conditional plots
# stats: statistical transformations like binning, quantiles, smoothing.
# scales: what scale an aesthetic map uses (exmaple: male = red, female = blue)
# coordinate system

# Example : BMI, PM2.5, Asthma

# Basic Plot
library(ggplot2)
load("~/Desktop/coursera-dss/Exploratory Data Analysis Week 2/data/maacs (2).Rda")
qplot(logpm25, NocturnalSympt, data = maacs, facets = . ~ bmicat, geom = c("point", "smooth"), method = "lm")

# Building Up in Layers
head(maacs[, 6:8]) # data frame
g <- ggplot(maacs, aes(logpm25, NocturnalSympt)) #Initial call to ggplot
summary(g) # summary of ggplot object
print(g)

p <- g + geom_point()
print(p) # Explicitly save and print ggplot object
 
g + geom_point() # Auto print plot object without saving
