# Reshaping Data

# Start with reshaping
library(reshape2)
head(mtcars)

# Melting data frames (tell melt function which of the variables are ID and measure variables)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
carMelt # the data is reshaped and is now tall and skinny
head(carMelt,n=3)
tail(carMelt,n=3)

# Casting data frames (reformat the data set into different sort of shapes)
cylData <- dcast(carMelt, cyl~variable)
cylData # for each cylinder, we have different measure of mpg & hp

cylData <- dcast(carMelt, cyl~variable, mean) # take the mean of each value
cylData

# Averaging values (Average a value within a common factor)
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

# Another way - split, then apply, unlist, and then combine
spIns <- split(InsectSprays$count, InsectSprays$spray) # split based on factor
spIns # this returns a list

sprCount <- lapply(spIns, sum) # list apply to get the total count for each factor
sprCount

unlist(sprCount) # unlist and return numeric vector

# Another way (after doing split) - sapply (apply + combine)
sapply(spIns, sum)

# Another way - plyr package
library(plyr)
ddply(InsectSprays,.(spray), summarize, sum=sum(count))

# Creating a new variable (useful for different data analysis)
spraysums <- ddply(InsectSprays,.(spray), summarize, sum=ave(count, FUN=sum))
dim(spraysums)
head(spraysums)
