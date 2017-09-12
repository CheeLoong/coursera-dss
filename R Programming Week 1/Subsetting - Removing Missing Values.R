# Subsetting - Removing Missing Values

#Removing NA Values
## A common task is to remove missing values (NAs)

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x) #create a logical vector which tells TRUE if its missing value and otherwise
x[!bad] #remove NA by subsetting

## What if there are multiple things and you want to take subset of no missing values?
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x,y)
good
x[good]
y[good]

## Can also use complete.cases to remove missing values from data frames
airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]
