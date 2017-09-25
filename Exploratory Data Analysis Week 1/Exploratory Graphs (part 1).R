# Exploratory Graph (part 1)

if(!file.exists("./data")){dir.create("./data")}
pollution <- read.csv("data/avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)

# Simple Summaries of Data
# One dimension: (1) Six-number summary, (2) Boxplots, (3) Histograms, (4) Density plot, (5) Barplot

# Six Number Summary
summary(pollution$pm25)

# Boxplot
boxplot(pollution$pm25, col = "blue")

# Histograms
hist(pollution$pm25, col = "green")
rug(pollution$pm25)

hist(pollution$pm25, col = "green", breaks = 100) # see the shape of distribution in deeper detail
rug(pollution$pm25) 

# Overlaying features
boxplot(pollution$pm25, col = "blue")
abline(h = 12) # 12 is the benchmark, so we can overlay number 12 on our boxplot

hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col="magenta", lwd = 4)

# Barplot (graphical summary for categorical data)
barplot(table(pollution$region), col = "wheat", main = "Numer of Counties in Each Region")
