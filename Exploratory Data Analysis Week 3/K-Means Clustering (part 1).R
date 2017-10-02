# K-Means Clustering (part 1)

# K-means clustering - example
set.seed(1234)
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)        
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

# How K-means clustering work
# (1) starting centroids
# (2) assign observations to closest centroids
# (3) recalculate centroids
# (4) reassign observations to the new centroids
# (5) update centroids
