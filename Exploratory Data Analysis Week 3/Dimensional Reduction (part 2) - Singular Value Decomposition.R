# Dimensional Reduction (part 2)

# The Matrix data
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

# Components of Singular Value Decomposition (SVD) - u and v
svd1 <- svd(scale(dataMatrixOrdered))
par(mar = rep(4, 4), mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd1$u[, 1], 40:1, xlab = "Row", ylab = "First left singular vector", pch = 19) # First left singular vector has negative values for rows 40 through 17, has a positive values for remaining rows, this shows clear separation in the means of the two sets of rows
plot(svd1$v[, 1], xlab = "Column", ylab = "First right singular vector", pch = 19)
# First right singular vector shows change in the mean between first five columns and the second five columns; SVD immediately picked up the shift in the means, both in row and column dimension.

# Components of the SVD - variance explained 
par(mfrow = c(1, 2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained", pch = 19)

# Relationship to principal components: SVD = Principal Components Analysis
svd1 <- svd(scale(dataMatrixOrdered))
pca1 <- prcomp(dataMatrixOrdered, scale = TRUE)
plot(pca1$rotation[, 1], svd1$v[, 1], pch = 19, xlab = "Principal Component 1", ylab = "Right Singular Vector 1")
abline(c(0,1))

# Components of the SVD - variance explained (A closer look)
constantMatrix <- dataMatrixOrdered*0
for(i in 1:dim(dataMatrixOrdered)[1]){constantMatrix[i,] <- rep(c(0,1), each = 5)} # the first five columns are zeroes, the second five columns are ones
svd1 <- svd(constantMatrix)
par(mfrow = c(1,3))
image(t(constantMatrix)[, nrow(constantMatrix):1])
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained", pch = 19)
# Even though the dimension is 40 x 10, there's really one dimension, first five col = 0, second five col = 1

# What if we add a second pattern?
set.seed(678910)
for(i in 1:40) {
        # flip a coin
        coinFlip1 <- rbinom(1, size = 1, prob = 0.5)
        coinFlip2 <- rbinom(1, size = 1, prob = 0.5)
        # if coin is heads add a common pattern to that row
        if(coinFlip1){
                dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 5), each = 5)
        }
        # Second pattern is going to be alternating between the columns
        if(coinFlip2){
                dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 5), 5)
        }
}

hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]

# Singular value decomposition - true patterns (we simulated it!)
svd2 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rep(c(0, 1), each = 5), pch = 19, xlab = "Column", ylab = "Pattern 1")
plot(rep(c(0, 1), 5), pch = 19, xlab = "Column", ylab = "Pattern 2")
## question is, can we come up with an algorithm that can pick up the patterns?

# v and patterns of variance in rows 
svd2 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd2$v[, 1], pch = 19, xlab = "Column", ylab = "First right singular vector") # this panel roughly picks up the block mean pattern, the first five are somewhat lower, the other five are somewhat higher
plot(svd2$v[, 2], pch = 19, xlab = "Column", ylab = "Second right singular vector") # the second panel try to pick up the alternating mean pattern, althou not very obvious

# d and variance explained
svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Percent of variance explained", pch = 19)
# The first component explains over 50% of the variation in the dataset, this is because the shift pattern is very strong.
