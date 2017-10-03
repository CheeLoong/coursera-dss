# Dimension Reduction (Part 1)

# Matrix data
set.seed(12345)
par(mar = rep(2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1]) # 1:10, 1:40 specify the x and y axis label; the transpose & the subsetting is to make the heatmap look like our dataframe


# Cluster the data
par(mar = rep(0.2, 4))
heatmap(dataMatrix) # run hierarchical analysis on this dataset; no particular pattern because its random generated data

# What if we add a pattern?
set.seed(678910)
for (i in 1:40) {
        # flip a coin
        coinFlip <- rbinom(1, size = 1, prob = 0.5)
        # if coin is heads add a common pattern to that row
        if(coinFlip) {
                dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5) # the pattern: 5 of the columns have a mean of 0, the other 5 have a mean of 3
        }
}

# What if we add a pattern? - the data
par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1]) # the right hand 5 columns are more yellow means higher value, red means lower value (left 5: mean of 0, right 5: mean of 3)

# What if we add a pattern? - the clustered data
par(mar = rep(0.2, 4))
heatmap(dataMatrix) # run hierarchical clustering using heatmap; shows data splits into 2 clusters, on the row there's no apparent cluster

# Patterns in rows and columns (take a closer look on marginal means of the rows/cols)
hh <- hclust(dist(dataMatrix)) # perform hierarchical clustering
dataMatrixOrdered <- dataMatrix[hh$order, ] # reorder according to the hierarchical analysis of the rows
par(mar = rep(5, 4))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1, xlab = "Row Mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrdered), xlab = "Column", ylab = "Column Mean", pch = 19)
# there's a clear shift in the mean of the rows as you move across the rows, also a clear shift in the mean of the cols as you move across the cols


