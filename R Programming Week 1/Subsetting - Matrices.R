# Subsetting - Matrices
## Matrices can be subsetted in the usual way with (i,j) type indices.

x <- matrix(1:6, 2, 3)
x
x[1, 2]
x[2, 1]

#Indices can also be missing.
x[1, ]
x[, 2]

## By default, when a single element of a matrix is retrieved, it is returned as a vector of length 1 rather than 1 x 1 matrix. This behavior can be turned off by setting drop = FALSE (drop dimension)
x <- matrix(1:6, 2, 3)
x
x[1, 2]
x[1, 2, drop = FALSE]

## Similarly, subsetting a single column or single row will give you a vector, not a matrix (by default)

x <- matrix(1:6, 2, 3)
x[1, ]
x[1, , drop = FALSE]
