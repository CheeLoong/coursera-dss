# Subsetting - Basics

# Subsetting
## There are a number of operators that can be used to extract subsets of R objects.
# - [ always returns an object of the same class as the original; can be used to select more than one element (there is one exception)
# - [ [ is used to extract element of a list or a data frame; it can only be used to extract a single element and the class of the returned object will not necessarily be a list or data frame
# - $ is used to extract elements of a list or data frame by name; semantics are similar to hat of [ [ .

x <- c("a", "b", "c", "c", "d", "a")
#subset vector x using numeric index
x[1]
x[2]
x[1:4]

#subset vector x using logical index
x[x > "a"]

#create a logical vector then subset accordingly
u <- x > "a"
u
x[u]
