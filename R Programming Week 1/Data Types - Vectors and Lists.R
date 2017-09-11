# Data Types - Vectors and Lists

# Creating Vectors
## The c() function can be used to create vectors of objects.

x <- c(0.5, 0.6) # numeric
x <- c(TRUE, FALSE) # logical
x <- c(T, F) # logical
x <- c("a", "b", "c") # character
x <- 9:29 # integer
x <- c(1+0i, 2+4i) # complex

## Using the vector() function
x <- vector("numeric", length = 10)
x

# Mixing objects (Coercion)
## When different objects are mixed in a vector, coercion occurs so that every element in the vector is of the same class.
y <- c(1.7, "a") # character, the least common denominator is going to be character, so y is a character vector where first element is going to be string 1.7 and second element is letter "A"
y <- c(TRUE, 2) # numeric,  the true will be converted to a number, by convention in R, true is represented by 1 and false is represented by 0.
y <- c("a", TRUE) #  character, the character vector has first element to be letter "a", and second element to be string TRUE

# Explicit Coercion
## Objects can be explicitly coerced from one class to another using the as.* functions

x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

## Nonsensical coercion results in NAs.
x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)
as.complex(x)

# Lists
## Lists are a special type of vector that can contain elements of different classes.

x <- list(1, "a", TRUE, 1+4i)
x #it doesnt print out like a vector because every element is different, list has double bracket around them
