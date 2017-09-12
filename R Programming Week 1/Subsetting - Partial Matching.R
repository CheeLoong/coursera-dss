# Subsetting - Partial Matching

# Partial Maching
## Partial matching of names is allowed with [ [ and $.
x <- list(aardvark = 1:5)
x
x$a
x[["a"]]
x[["a", exact = FALSE]]
