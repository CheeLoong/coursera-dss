# K-Means Clustering (part 2)

# kmeans()
set.seed(1234)
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)        
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers = 3) # perform k-means clustering analysis and set 3 centroids
names(kmeansObj)
kmeansObj$cluster 

# visualise the kmeans()
oldpar <- par("mar")
par(mar = rep(0.2, 4))
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)

# heatmaps - making heatmap to match data frame then re-order according to cluster
set.seed(1234)
par(mar = oldpar)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),] 
dataMatrix
image(dataMatrix)
box()
title(main = "dataMatrix", font.main = 4)

image(t(dataMatrix))
box()
title(main = "t(dataMatrix)", font.main = 4) # Transpose 

image(t(dataMatrix)[,nrow(dataMatrix):1]) 
box()
title(main = "t(datamatrix)[,12:1]", font.main = 4) # Inverse the columns (this heat map is alligned with the dataframe)

image(t(dataMatrix)[,order(kmeansObj$cluster)])
box()
title(main = "t(dataMatrix)[,order(kmeansObj$cluster)]", font.main = 4) # re-order the columns based on clusters

kmeansObj <- kmeans(dataMatrix, centers=3) 
par(mfrow=c(1,2), mar = c(2, 4, 0.1, 0.1)) 
image(t(dataMatrix)[,nrow(dataMatrix):1]) # t = transpose
image(t(dataMatrix)[,order(kmeansObj$cluster)])

