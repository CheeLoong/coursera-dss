# Connections: interfaces to the Outside World
Data are read in using connection interfaces. Connections can be made to files (most common) or to other more exotic things.
- file, opens a connection to a file
- gzfile, opens a connection to a file compressed with gzip
- bzfile,  opens a connnection to a file compressed with bzip2
- url, opens a connection to a webpage

str(file)
- description is the name of the file
- open is a code indicating
- "r" read only, "w" writing (and initizing a new file), "a" appending

# Connections
In general, connections are powerful tools that let you navigate files or other external objects. In practice, we often don't need to deal with the connection interface directly.

con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)

is the same as:
data <- read.csv("foo.txt")

# Reading Lines of a Text File

con <- gzfile("words.gz")
x <- readLines(con, 10)
x

## writeLines takes a character vector and writes each element one line at a time to a text file. 

## readLines can be useful for reading in lines of webpages
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)
