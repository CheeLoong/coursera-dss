#Reading from MySQL

#Step 1 - Install MySQL
#http://www.dev.mysql.com/doc/refman/5.7/en/installing.html

#Step 2 - Install RMySQL
install.packages("RMySQL")
library(RMySQL)

#Connecting and listing databases (web-facing version of MySQL database)
ucscDb <- dbConnect(MySQL(),user="genome",
                    host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;") ; dbDisconnect(ucscDb); # "show databases" is a MySQL command, TRUE respond is coming from dbDisconnect
result # shows all the databases that is available within the mySQL server that is located within this host

# Connecting to hg19 (one of the databases) and listing tables
hg19 <- dbConnect(MySQL(), user="genome", db="hg19",
                  host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

# Get dimensions of a specific table
dbListFields(hg19, "affyU133Plus2") # hg19 is the database, the "affy.." is the table. This shows names of the columns under "affy.." 
dbGetQuery(hg19, "select count(*) from affyU133Plus2") # This shows number of rows

# Read from the table
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

# Select a specific subset
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
affyMisSmall <- fetch(query,n=10); dbClearResult(query) #fetch smaller set of data, then clear query
dim(affyMisSmall)
dbDisconnect(hg19)
