# Data Types - Missing Values

# Missing Values
## Missing values are denoted by NA or NAN for undefined mathematical operations.
### is.na() is used to test objects if they are NA
### is.nan() is used to test objects if they are NaN
### NA values have a class also, so there are integer NA, character NA, etc.
### A NaN value is also a NA but the converse is not true.

x <- c(1, 2, NA, 10, 3)
is.na(x) #returns logical vector
is.nan(x) 
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)
