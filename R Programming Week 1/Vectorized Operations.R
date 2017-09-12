# Vectorized Operations

## Many operations in R are vectorized making code more efficient, concise, and easier to read.
x <- 1:4; y <- 6:9 
x + y
x > 2
x >= 2
y == 8 # test for equality
x * y 
x / y

# Vectorized Matrix Operations
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x
y
x * y # element-wise multiplication (not a matrix multiplication)
x / y

x %*% y # true matrix multiplication
