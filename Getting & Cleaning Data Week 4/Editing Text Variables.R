# Editing Text Variables  

# Download Baltimore camera data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.csv",method="curl")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

# Fixing character vectors - tolower(), toupper()
tolower(names(cameraData))

# Fixing character vectors - strsplit()
splitNames <- strsplit(names(cameraData),"\\.") # using string split to split names
splitNames[[5]]
splitNames[[6]]

# Quick aside - lists (Revise from previous learning)
mylist <- list(letters = c("A","b","c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)

mylist[1] # Show the first element of the list
mylist$letters # subset by the named variable
mylist[[1]] 

# Fixing character vectors - sapply()
# Applies a function to each element in a vector or list
# Important parameters: X, FUN
# The objective is to separate the "1" in the Location.1 variable
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement) # We only want to take the first element from the split Names list

# Download Peer review data (N/A anymore for some reason, but we still have the data in the folder)
if(!file.exists("./data")){dir.create("./data")}
fileUrl1 ="http://www.sharecsv.com/dl/e70e9c289adc4b87c900fdf69093f996/reviews.csv"
fileUrl2 ="http://www.sharecsv.com/dl/0863fd2414355555be0260f46dbe937b/solutions.csv"
download.file(fileUrl1,destfile = "./data/reviews.csv", mode="wb")
download.file(fileUrl2,destfile = "./data/solutions.csv", mode="wb")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

# Fixing character vectors - sub()
# Important parameters: pattern, replacement, x
# The objective is to remove the underscore in the variable names
names(reviews)
sub("_","",names(reviews)) # everytime R sees an "_", replace it with nothing

# Fixing character vectors - gsub()
# Notice when you use sub command, you only replace the first "_"
# Therefore you use gsub command to replace all the "_"
testName <- "this_is_a_test"
sub("_","",testName) 
gsub("_","",testName) 

# Finding values - grep(), grepl()
# The objective is to find rows that contain "Alameda" in this dataset
grep("Alameda", cameraData$intersection) #4th, 5th, & 36th element of the intersection variable
# Alternatively, we can use grepl to return the result of Alameda showing in the interesection variable
table(grepl("Alameda", cameraData$intersection))
# Another thing that can be done is to subset the data that doesn't have Alameda

cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]
cameraData2
# More on grep() - can also return the values where Alameda appears
grep("Alameda", cameraData$intersection, value=TRUE)
# When a value does not exist, it will return interger(0)
grep("Jeffstreet", cameraData$intersection)
# Alternatively,
length(grep("Jeffstreet", cameraData$intersection))

# More useful string functions
library(stringr)
# shows number of characters with nchar(), space is a character too! 
nchar("Lian Chee Loong")
# can also take part of string out with substr()
substr("Lian Chee Loong", 1,9)
# can also paste two strings together, but lets try 3 strings with paste()
paste("Lian","Chee","Loong")
paste("Lian","Chee","Loong", sep=" EZ ") #set the separation with sep argument
# often in data analysis, you want strings together with no space with paste0()
paste0("Lian","Chee","Loong")
# you can trim off excess space that appears at the end of a string with str_trim()
str_trim("Lian           ")
