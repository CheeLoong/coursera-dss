# Reading Local Flat Files

# Check if data file exist, if not; create a folder named "data"
if(!file.exists("data")) {
        dir.create("data")
}

# Download this address link and set the destination to the data folder
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv", method="curl")

# Show whats in the data folder
list.files("./data")

#Reading table(Baltimore example)
# cameraData <- read.table("./data/cameras.csv") # This shows error
head(cameraData) #Doesn't exist because r wasnt able to read the file

cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
head(cameraData)

#Alternatively, could use read.csv(), which automatically set sep = ",", header = TRUE
cameraData <- read.csv("./data/cameras.csv")
head(cameraData)
