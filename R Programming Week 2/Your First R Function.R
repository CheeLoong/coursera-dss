#Your First R Function
#(1) use the function syntax, specify the arguments, and how to return the value

add2 <- function(x, y) {
        x + y
}

#(2) return specific values based on arguments
#This function returns the subset of the vector x that is bigger than ten.
above10 <- function(x) {
           use <- x > 10 #construct a logical statement that returns true or false whether x > 10
           x[use] # subset the vector x with this logical vector
}
#This function returns the subset of the vector x that is bigger than n.
above <- function(x,n) {
         use <- x > n
         x[use]
}

#(3) Take your argument and loop through each column.
#Calculate the mean of each column of matrix or dataframe.

columnmean <- function(y, removeNA = TRUE) {
        nc <- ncol(y) #calculate number of column
        means <- numeric(nc) #initialize a vector that stores the means for each column, length of this vector must be equal to number of column.
        for(i in 1:nc) {
          means[i] <- mean(y[, i], na.rm = removeNA) #Calculate mean for column i and store in means[i]
        }
        means
}

columnmean(airquality)
