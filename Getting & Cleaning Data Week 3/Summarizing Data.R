# Summarizing Data

# Gettin the data from the web:
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

# Look at a bit of the data
head(restData, n=3)
tail(restData,n=3)

# Make summary
summary(restData) # show counts for qualitative, show descriptive stats for quantitative

# More in depth information
str(restData) # check if you need to change quantitative variable to qualitative and so forth

# Quantiles in quantitave variables
quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))

# Make table
table(restData$zipCode,useNA="ifany") # use NA values if there is any, by default doesnt show NA value
table(restData$councilDistrict,restData$zipCode) # make 2 dimensional table

# Check for missing values
sum(is.na(restData$councilDistrict)) # count the value of NA values
any(is.na(restData$councilDistrict)) # check if there is any NA values
all(restData$zipCode > 0) # check to see if all observation satisfy the condition

# Row and column sums (Also can be used to check missing values)
colSums(is.na(restData)) # to show the sum of the NA in the columns in the data set
all(colSums(is.na(restData))==0) # to check if all column has a total NA sum = 0

# Values with specific characteristics
table(restData$zipCode %in% c("21212")) # to check if theres any zip code that falls into 21212
table(restData$zipCode %in% c("21212","21213")) # to check if theres any zip code thats either 21212 or 21213
restData[restData$zipCode %in% c("21212","21213"),] # subset rows with zipcode = 21212 or 21213 

# Cross tabs
data(UCBAdmissions)
DF= as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt

# Flat Tables
warpbreaks
warpbreaks$replicate <- rep(1:9, len=54) #replicate and add a column to make it 3D for learning purpose
xt <- xtabs(breaks ~., data=warpbreaks)
xt #pretty hard to see
ftable(xt) # summarize data in a more compact form in flat table

# Size of a data set
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")
