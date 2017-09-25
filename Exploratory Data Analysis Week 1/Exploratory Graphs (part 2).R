# Exploratory Graphs (part 2)

# Simpel Summaries of Data
# Two dimensions (1) Multiple/overlayed 1D plots (Lattice/ggplot2), (2) Scatterplots, (3) Smooth scatterplots
# >2 dimensions (1) Overlayed/multiple 2-D plots; coplots, (2) Use color, size, shape, to add dimensions, (3) Spinning plots, (4) Actual 3D plots (not that useful)

# Multiple Boxplots (1 Dimensional - east west variable (categorical), the other dimensions is pm 2.5 variable)
boxplot(pm25 ~ region, data = pollution, col = "red") # west has an average that's lower but has generally a larger spread

# Multiple Histograms
par(mfrow = c(2,1), mar = c(4,4,2,1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green") # west has an average that's lower but has generally a larger spread

# Scatterplot
with(pollution, plot(latitude, pm25)) # as the latitude increases, you're going north
abline(h = 12, lwd = 2, lty = 2) 

# Scatterplot - Using Color
with(pollution, plot(latitude, pm25, col = region)) # red circles are western counties, black are eastern
abline(h = 12, lwd = 2, lty = 2) 

# Multiple Scatterplots
par(mfrow = c(1,2), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East")) # in both cases, higher polution countries tend to be in the middle latitude


