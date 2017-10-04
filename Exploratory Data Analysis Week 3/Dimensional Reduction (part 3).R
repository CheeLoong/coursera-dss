# Dimension Reduction (part 3)


# The matrix data
set.seed(12345)
par(mar = rep(2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1]) 

par(mar = rep(0.2, 4))
heatmap(dataMatrix)

set.seed(678910)
for (i in 1:40) {
        # flip a coin
        coinFlip <- rbinom(1, size = 1, prob = 0.5)
        # if coin is heads add a common pattern to that row
        if(coinFlip) {
                dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5) # the pattern: 5 of the columns have a mean of 0, the other 5 have a mean of 3
        }
}

par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1]) 

par(mar = rep(0.2, 4))
heatmap(dataMatrix) 

hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]

# Missing values
dataMatrix2 <- dataMatrixOrdered
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <- NA
## svd1 <- svd(scale(dataMatrix2)) # doesn't work

# Imputing {impute}
library(impute)
dataMatrix2 <- dataMatrixOrdered
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <- NA
dataMatrix2 <- impute.knn(dataMatrix2)$data # if k = 5, takes closest 5 points and take average to replace the NA value
svd1 <- svd(scale(dataMatrixOrdered)); svd2 <- svd(scale(dataMatrix2))
par(mar = rep(4,4), mfrow=c(1,2)); plot(svd1$v[,1], pch = 19); plot(svd2$v[,1], pch = 19) # original data matrix vs imputed data matrix

# Face example
load("data/face.rda")
par(mar = rep(4,4))
image(t(faceData)[, nrow(faceData):1])

# Face example - variance explained
svd1 <- svd(scale(faceData))
plot(svd1$d^2/sum(svd1$d^2), pch = 19, xlab = "Singular vector", ylab = "Variance explained")

# Face example - create approximations (use matrix multiplication that uses fewer components than the original data set)
svd1 <- svd(scale(faceData))
## Note that %*% is matrix multiplication

## Here svd1$d[1] is a constant
approx1 <- svd1$u[, 1] %*% t(svd1$v[, 1]) * svd1$d[1] # Uses only the first singular vector

## In these examples we need to make the diagonal matrix out of d
approx5 <- svd1$u[, 1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[, 1:5]) # Uses the first 5 singular vectors
approx10 <- svd1$u[, 1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[, 1:10]) # Uses the first 10 singular vectors

# Face example - plot approximations
par(mfrow = c(1, 4))
image(t(approx1)[, nrow(approx1): 1], main = "First singular vector")
image(t(approx5)[, nrow(approx5): 1], main = "First 5 singular vectors")
image(t(approx10)[, nrow(approx10): 1], main = "First 10 singular vectors")
image(t(faceData)[, nrow(faceData): 1], main = "Original Data")
