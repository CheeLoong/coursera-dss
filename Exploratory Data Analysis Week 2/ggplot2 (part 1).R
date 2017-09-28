# ggplot2 (part 1)

library(ggplot2)
str(mpg)

# ggplot2 "Hello World"
qplot(displ, hwy, data = mpg)

# modifying aesthetics
qplot(displ, hwy, data = mpg, color = drv) # color is mapped to drive variable, different colour will be assigned to diff drive

# Adding a geom (low S)
qplot(displ, hwy, data = mpg, geom = c("point", "smooth")) # 95% confidence interval are indicated by the gray zone

# Histograms
qplot(hwy, data = mpg, fill = drv) # histogram filled with colour by different drive

# Facets (splitting groups into panels)
qplot(displ, hwy, data = mpg, facets =.~drv) # variable on the right (drv) determines columns of the panels, variable on the left (.) indicates row of the matrix
qplot(hwy, data = mpg, facets = drv~.,binwidth = 2)

# Example : MAACS 
if(!file.exists("./data")){dir.create("./data")}
load("~/Desktop/coursera-dss/Exploratory Data Analysis Week 2/data/maacs.Rda")
str(maacs) # eno: Exhaled nitric oxide (higher number indicates pulmonary inflammation), pm25: fine particular matter (dust), mopos: sensitized to mouse allergan

# Histogram
qplot(log(eno), data = maacs) # Histogram, looks like there's 3 peaks
qplot(log(eno), data = maacs, fill = mopos) # Colour coded Histogram, childrens that are mouse positive have slightly higher pulmonary inflammation on average

# Density Smooth
qplot(log(eno), data = maacs, geom = "density")
qplot(log(eno), data = maacs, geom = "density", color = mopos) 

# Scatterplots: eNO vs. PM2.5 (see if they are related)
qplot(log(pm25), log(eno), data = maacs) # hard to see relationship
qplot(log(pm25), log(eno), data = maacs, shape = mopos) # separated by shape, hard to see still
qplot(log(pm25), log(eno), data = maacs, color = mopos) # separating by colour

# Adding a geom
qplot(log(pm25), log(eno), data = maacs, color = mopos) + geom_smooth(method = "lm") # look at linear relationship between pm2.5 and ENO for mouse-allergan childrens and non mouse-allergan childrens, for the non-mouse allergan, there's a negative association between dust and pulmonary inflammation, but not particularly a strong relationship due to wide confidence intervals; there appears to be an increasing relationship between dust and pulmonary inflammation.

# Another way to look at the data using facets
qplot(log(pm25), log(eno), data = maacs, facets = .~mopos) + geom_smooth(method = "lm")

