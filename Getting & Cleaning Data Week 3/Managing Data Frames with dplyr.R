# Managing Data Frames with dplyr - Basic Tools


library(dplyr)
options(width = 105)

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://github.com/DataScienceSpecialization/courses/blob/master/03_GettingData/dplyr/chicago.rds?raw=true"
download.file(fileUrl, destfile="./data/chicago.rds", mode="wb")
chicago <- readRDS("./data/chicago.rds")

dim(chicago)
str(chicago)
names(chicago)

# dplyr - select function (subset columns)
head(select(chicago, city:dptp)) # look at the selected columns
head(select(chicago, -(city:dptp))) # look at the columns that are not selected

# doing select function in regular r, which is slightly more work is to use index
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

# dplyr - filter function (subset rows based on conditions)
chic.f <- filter(chicago, pm25tmean2 > 30) # filter based on 1 logical sequence
head(chic.f, 10)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80) # filter based on 2 logical sequences
head(chic.f)

# dplyr - arrange function (reorder the rows of a data frame based on the values of a column)
chicago <- arrange(chicago, date) # arranging the rows based on the column date in ascending order
head(chicago)
tail(chicago)
chicago <- arrange(chicago, desc(date)) # arraging the rows based on the column date in desc order
head(chicago)
tail(chicago)

# dplyr - rename function (rename variable in R)
chicago <- rename(chicago, pm25=pm25tmean2, dewpoint=dptp)
head(chicago)

# dplyr - mutate function (transform existing variables or create new variables)
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(select(chicago, pm25, pm25detrend))

# dplyr - group-by function (split a dataframe according to certain categorical variables)
chicago <- mutate(chicago, tempcat = factor(1 * (tmpd>80), labels = c("cold","hot"))) # create a temporary temperature categorical variable which indicate hot or cold based on degree, note: (tmpd > 80) is really a logical expression that can be TRUE or FALSE. By using 1*(tmpd > 80) the logical is automatically coerced to be an integer 
head(chicago)

hotcold <- group_by(chicago, tempcat) # essentially split 1 dataframe into 3 different dataframes (hot dataframe, cold data frame, NA data frame)
hotcold
summarize(hotcold, pm25=mean(pm25), o3=max(o3tmean2), no2=median(no2tmean2))
summarize(hotcold, pm25=mean(pm25, na.rm = TRUE), o3=max(o3tmean2), no2=median(no2tmean2))

# summarize based on year
chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago,year)

summarize(years, pm25=mean(pm25, na.rm = TRUE), o3=max(o3tmean2), no2=median(no2tmean2))

# summarized based on months of each year
chicago %>% mutate(month=as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
