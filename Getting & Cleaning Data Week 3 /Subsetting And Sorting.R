# Subsetting and Sorting

# Subsetting - quick review
set.seed(13435)
X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10),"var3"=sample(11:15))
X
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X
X[,1]
X[, "var1"]
X[1:2, "var2"]

# Subset using logical ands and ors statement
X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var1 <= 3 | X$var3 > 15),]

# Dealing with missing values
X[which(X$var2 > 8),] # it doesn't return NA values

# Sorting
sort(X$var1)
sort(X$var1, decreasing=TRUE)
sort(X$var2, na.last=TRUE)

# Ordering
X[order(X$var1),]
X[order(X$var1,X$var3),] # sort var1 first, and if there are repeated values in var1, sort var3

# Ordering with plyr
library(plyr)
arrange(X,var1)
arrange(X,desc(var1))

# Adding rows and columns
X$var4 <- rnorm(5)
X
Y <- cbind(X, rnorm(5)) # column bind
Y
