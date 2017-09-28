# ggplot2 (part 4)

# A Notes about Axis Limits
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50, 2] <- 100 ## Change 50th datapoint to be outlier
plot(testdat$x, testdat$y, type = "l", ylim = c(-3, 3))

g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()
g + geom_line() + ylim(-3, 3) # Outlier missing
g + geom_line() + coord_cartesian(ylim = c(-3, 3)) # Outlier included

# More Complex Example
# How does the relationship between PM2.5 and nocturnal symptoms vary by BMI and NO_2? Unlike our previous BMI varible, NO_2 is continuous. We need to make NO2 categorical so we can condition on it in the plotting - use cut() function for this

# Making NO_2 Tertiles

## Calculate the deciles of the data (categorize continuous data)
load("~/Desktop/coursera-dss/Exploratory Data Analysis Week 2/data/maacs (2).Rda")
cutpoints <- quantile(maacs$logno2_new, seq(0, 1, length = 4), na.rm = TRUE) # figure out 3 separate categories, 0~33, 33~66, 66~100
cutpoints 

## Cut the data at the deciles and create a new factor variable
maacs$no2dec <- cut(maacs$logno2_new, cutpoints)

## See the levels of the newly created factor variables
levels(maacs$no2dec)

# Code for Final Plot

## Setup ggplot with data frame
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
g

## Add layers
g + geom_point(alpha = 1/3) + # add points with 1/3 alpha transparency
          facet_wrap(bmicat ~ no2dec, nrow = 2, ncol = 4) + # make panels
          geom_smooth(method="lm", se=FALSE, col="steelblue") + # add smoother
          theme_bw(base_family = "Avenir", base_size = 10) + # change theme
          labs(x = expression("log " * PM[2.5])) + # add labels
          labs(y = "Nocturnal Symptoms") + 
          labs(title = "MAACS Cohort")
