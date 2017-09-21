# Reading Excel Files

setwd("/Users/Loong/Desktop/coursera-dss/Getting & Cleaning Data Week 1")
getwd()

# Download the excel file to load
if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://tcd.blackboard.com/webapps/dur-browserCheck-BBLEARN/samples/sample.xlsx"
download.file(fileUrl,destfile="./data/sample.xlsx",method="curl")
dateDownloaded <- date()
dateDownloaded

# read.xlsx(), read.xlsx2() {xlsx package} which requires rJava & xlsxjars
list.files("./data")
install.packages("openxlsx")
library(openxlsx)


sampleData <- read.xlsx("./data/sample.xlsx", sheet = 1, colNames = TRUE)
head(sampleData)

# Reading specific rows and columns (not applicable in this excel file)
colIndex <- 2:3
rowIndex <- 1:4
sampleDataSubset <- read.xlsx("./data/sample.xlsx", sheet = 1, cols = colIndex, rows = rowIndex)
sampleDataSubset
