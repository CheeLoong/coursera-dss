# Clustering Case Study (Samsung)

# Slightly processed data
load("data/samsungData.rda")
names(samsungData)[1:12]

table(samsungData$activity) # shows activity label 

# The idea is that you want to separate the activities based on the many features that are collected by the accelerometer and the gyroscope

# Plotting average acceleration of the first subject
samsungData <- transform(samsungData, activity = factor(activity)) # convert activity variable from character into a factor variable
sub1 <- subset(samsungData, subject == 1)
par(mfrow = c(1, 2), mar = c(5, 4, 1, 1))
plot(sub1[, 1], col = sub1$activity, ylab = names(sub1)[1]) # mean body acceleration in the x direction
plot(sub1[, 2], col = sub1$activity, ylab = names(sub1)[2]) # mean body acceleration in the y direction
legend("bottomright", legend = unique(sub1$activity), col = unique(sub1$activity), pch = 1, cex = 0.5)
## in the mean body acceleration for x, walk, walk down and walk up has more variability than standing and sitting, but overall not a strong pattern.

# Clustering based just on average acceleration
source("myplclust.R")
par(mfrow = c(1,1))
distanceMatrix <- dist(sub1[, 1:3])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))

# Plotting max acceleration for the first subject
par(mfrow = c(1,2))
plot(sub1[, 10], pch = 19, col = sub1$activity, ylab = names(sub1)[10]) # max body acceleration in the x direction
plot(sub1[, 11], pch = 19, col = sub1$activity, ylab = names(sub1)[11]) # max body acceleration in the y direction
## in the max body acceleration in x direction, laying and standing and sitting dont show too much variability, but walking, walking up and down shows a lot of variability.


# Clustering based on maximum acceleration
source("myplclust.R")
par(mfrow = c(1,1))
distanceMatrix <- dist(sub1[, 10:12])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))
# two clear clusters, on the LHS: various walking activities, RHS: various non-moving activities, max acceleration clustering seems to separate moving vs non-moving activities.

# Singular Value Decomposition
svd1 = svd(scale(sub1[, -c(562,563)])) # remove last two columns which are activity identifier and the subject
par(mfrow = c(1, 2))
plot(svd1$u[, 1], col = sub1$activity, pch = 19) # First left singular vector
plot(svd1$u[, 2], col = sub1$activity, pch = 19) # Second left singular vector

## The first singular vector separate out moving from the non-moving activities, second singular vector seems to separate magnenta-coloured activites from others, but still vague overall. (According to the example from Youtube, this means that the second concept is relatively unknown, and therefore we can use the right singular vector to try and discover the second concept)

# Find maximum contributor
par(mfrow = c(1, 1))
plot(svd1$v[, 2], pch = 19) # see which of these features contributing to the most the variation between the different observations 
maxContrib <- which.max(svd1$v[, 2]) # which of the 500 features contributes most of the variations across observations

# New clusteringing; max acceleration + maximum contributor
distanceMatrix <- dist(sub1[, c(10:12, maxContrib)])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))

# K-Means clustering (nstart = 1, first try)
kClust <- kmeans(sub1[, -c(562, 563)], centers = 6)
table(kClust$cluster, sub1$activity)

# K-Means clustering (nstart = 1, second try)
kClust <- kmeans(sub1[, -c(562, 563)], centers = 6, nstart = 1)
table(kClust$cluster, sub1$activity)

# K-Means clustering (nstart = 100, first try)
kClust <- kmeans(sub1[, -c(562, 563)], centers = 6, nstart = 100)
table(kClust$cluster, sub1$activity)

# K-Means clustering (nstart = 100, second try)
kClust <- kmeans(sub1[, -c(562, 563)], centers = 6, nstart = 100)
table(kClust$cluster, sub1$activity)

# Cluster 1 Variable Centers (Laying)
plot(kClust$centers[2, 1:10], pch = 19, ylab = "Cluster Centers", xlab = "")

# Cluster 2 Variable Centers (Walking)
plot(kClust$centers[4, 1:10], pch = 19, ylab = "Cluster Centers", xlab = "")
