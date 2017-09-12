# Subsetting - Lists

# Subsetting Lists
x <- list(foo = 1:4, bar = 0.6)
x[1] # this gives a list that contains the sequence 1 through 4
x[[1]] # this gives the sequence 1 through 4 
x$bar 
x[["bar"]]
x["bar"] # this gives a list with the element bar

# Extracing multiple elements from a list
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1,3)]

## The [ [ operator can be used with computed indices; $ can only be used with literal names.
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo" #create variable name with the string "foo"
x[[name]]
x$name # element 'name' doesn't exist
x$foo # element 'foo' does exist

# Subsetting Nested Elements of a List
## The [ [ can take an integer sequence.
x <- list(a = list(10,12,14), b=c(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]
 