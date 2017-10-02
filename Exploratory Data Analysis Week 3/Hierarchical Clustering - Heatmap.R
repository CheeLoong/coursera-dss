# Hierarchical Clustering - Heatmap

set.seed(123)
x <- rnorm(9, mean = rep(1:3, each = 3), sd = 0.2)        
y <- rnorm(9, mean = rep(c(1, 2, 1), each = 3), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:9))

dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
myplclust(hClustering, lab = rep(1:3, each = 3), lab.col = rep(1:3, each = 3))

dataMatrix <- as.matrix(dataFrame)
colors <- heat.colors(15, alpha = 0.5)
heatmap.2(dataMatrix, trace = "none", cellnote = dataMatrix, notecex = 1.0, notecol = "black")

