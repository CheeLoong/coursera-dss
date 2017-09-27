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
str(maacs)

# Histogram
qplot(log(eno), data = maacs) # Histogram
qplot(log(eno), data = maacs, fill = mopos) # Colour coded Histogram

# Density Smooth
qplot(log(eno), data = maacs, geom = "density")
qplot(log(eno), data = maacs, geom = "density", color = mopos)

# Scatterplots: eNO vs. PM2.5
qplot(log(pm25), log(eno), data = maacs)
qplot(log(pm25), log(eno), data = maacs, shape = mopos) # separating by shape
qplot(log(pm25), log(eno), data = maacs, color = mopos) # separating by colour

# Adding a geom
qplot(log(pm25), log(eno), data = maacs, color = mopos) + geom_smooth(method = "lm")

# Facets
qplot(log(pm25), log(eno), data = maacs, facets = .~mopos) + geom_smooth(method = "lm")

