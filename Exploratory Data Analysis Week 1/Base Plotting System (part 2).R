# Base Plotting Functions (part 2)

# Base Plotting Functions
# plot: make a scatter plot, or other type depends on class of object
# lines: add lines to a plot
# points: add points to a plot
# text: add text labels to a plot using specified x,y coordinates
# title: add annotations to x,y axis labels, title, subtitle, outer margin
# mtext: add arbitratry text to the margins (inner or outer) of the plot
# axis: adding axis ticks/labels

# Base Plot with Annotation
# First demonstration:
library(datasets)
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City") # Add a title
dev.off()

# Second demonstration:
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City")) # Putting title directly into the call plot
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue")) # subset data points that are in May to be be blue colour, points: re-add points
dev.off()

# Third demonstration:
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n")) # type = n sets up the plot but doesn't draw anything
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue")) # set up data points that are in may
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red")) # set up data points that are not in may
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))
        
# Base Plot with Regression Line
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2) # add regression line to plot

# Multiple Base Plots
par(mfrow = c(1, 2))
with(airquality, {
        plot(Wind, Ozone, main = "Ozone and Wind")
        plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})


par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
        plot(Wind, Ozone, main = "Ozone and Wind")
        plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
        plot(Temp, Ozone, main = "Ozone and Temperature")
        mtext("Ozone and Weather in New York City", outer = TRUE)
                }) # outer title
