# Reading JSON file

library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)

# Nested objects in JSON
names(jsonData$owner)
jsonData$owner$login # each time jtleek is logging in

# Writing data frames to JSON
myjson <- toJSON(iris, pretty=TRUE) #if you are going to export data to API which requires JSON format
cat(myjson) 

# Convert JSON file back to data frames
iris2 <- fromJSON(myjson)
head(iris2)
