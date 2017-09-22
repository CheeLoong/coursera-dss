# Using data.table

# Create data tables (inherets from data.frame) just like data frames
install.packages("data.table")
library(data.table)
DF = data.frame(x=rnorm(9), y= rep(c("a","b","c"), each=3), z=rnorm(9))
head(DF,3)

DT = data.table(x=rnorm(9), y= rep(c("a","b","c"), each=3), z=rnorm(9))
head(DT,3)

# See all the data tables in memory
tables()

# Subsetting rows
DT[2,]
DT[DT$y=="a",] #looking at data table where y = a
DT[2,3]
DT[c(2,3),] #Subsetting rows 2 & 3
DT[,c(2,3)] #Subsetting columns 2 & 3

# Calculating values for variables with expressions
DT[,list(mean(x), sum(z))]
DT[, table(y)]

# Adding new columns
DT[,w:=z^2]
DT

# Multiple operations
DT[,m:={tmp <- (x+z) ; log2(tmp+5)}]
DT

# Plyr like operations
DT[,a:=x>0]
DT
DT[,b:=mean(x+w), by=a] # take the mean of x+w, for all a = TRUE, and for all a = FALSE
DT

# Special variables
set.seed(123)
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x] # .N counts the number of times grouped by the X variables

# Keys
DT <- data.table(x=rep(c("a","b","c"), each=100), y=rnorm(300))
setkey(DT,x)
DT['a']

# Joins / Merges
DT1 <- data.table(x=c('a','a','b','dt1'), y=1:4)
DT2 <- data.table(x=c('a','b','dt2'), z=5:7)
DT1
DT2
setkey(DT1,x) ; setkey(DT2,x)
merge(DT1, DT2)

# Fast reading
big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile() # set up temporary file
write.table(big_df, file=file, row.names = FALSE, col.names = TRUE, sep="\t", quote=FALSE) # copies the large data frame to a data.table
system.time(fread(file)) # reads it with fread, which is faster
system.time(read.table(file, header= TRUE, sep="\t")) # reads the data frame directly using read.table, which is slower
