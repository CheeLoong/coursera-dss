# Merging Data

# Download peer review data
if(!file.exists("./data")){dir.create("./data")}
fileUrl1 ="http://www.sharecsv.com/dl/e70e9c289adc4b87c900fdf69093f996/reviews.csv"
fileUrl2 ="http://www.sharecsv.com/dl/0863fd2414355555be0260f46dbe937b/solutions.csv"
download.file(fileUrl1,destfile = "./data/reviews.csv", mode="wb")
download.file(fileUrl2,destfile = "./data/solutions.csv", mode="wb")
reviews = read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews)
head(solutions)

# Merging data - merge()
names(reviews)
names(solutions)

mergedData = merge(reviews, solutions, by.x="solution_id", by.y="id", all=TRUE)  # all=TRUE shows na value if a value shows in one dataframe and not the other one
head(mergedData)

# Default - merge all common column names
intersect(names(solutions),names(reviews))
mergedData2 = merge(reviews, solutions, all=TRUE)
head(mergedData2)

# Using join in the plyr package
library(plyr)
df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), y=rnorm(10))
df1
df2
arrange(join(df1,df2), id)

# If you have multiple data frames
df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), y=rnorm(10))
df3 = data.frame(id=sample(1:10), z=rnorm(10))
dfList = list(df1,df2,df3) # put 3 data frames into 1 data frame list
join_all(dfList) #merges all different data frames on the basis of one common variables

