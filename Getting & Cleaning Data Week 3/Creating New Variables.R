# Creating New Variables

# Gettin the data from the web:
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

# Creating sequences

s1 <- seq(1,10,by=2) ; s1 # specify increment of the vector
s2 <- seq(1,10,length=3) ; s2 # specify length of the vector

x <- c(1,3,8,25,100); seq(along = x) # create index to loop over the 5 values or accessing subsets of data sets

# Subsetting variables
str(restData) # just to see what are the variables in this data frame
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe) # see how many of the neighbourhood are in Roland Park or Homeland.

# Creating binary variables
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

# Creating categorical variables (e.g. break zip codes into consecutive numbers)
restData$zipGroups <- cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)

# Easier cutting (Alternative but easier way)
install.packages("Hmisc")
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode, g=4) # cutting produces factor variables
table(restData$zipGroups)

# Creating factor variables (e.g. turning zipcode into a factor variable)
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

# Levels of factor variables
yesno <- sample(c("yes","no"), size=10, replace=TRUE) # this is character
yesnofac <- factor(yesno, levels=c("yes","no"))
relevel(yesnofac, ref="yes")
as.numeric(yesnofac)

# Using the mutate function to create new data frame with added new variable
library(Hmisc) ; library(plyr)
restData2 <- mutate(restData, zipGroups = cut2(zipCode,g=4))
table(restData2$zipGroups)
