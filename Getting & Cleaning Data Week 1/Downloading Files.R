# Downloading Files

getwd()
setwd("/Users/Loong/Desktop/coursera-dss")

#checking for a "data" directory and creating it if it doesn't exist

if(!file.exists("data")) {
        dir.create("data")
}

#Downloading a file from the web - download.file()

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv", method="curl")
list.files("./data")

dateDownloaded <- date()
dateDownloaded
