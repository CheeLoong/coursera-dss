# Variance data example

## Data Example
library(UsingR); data(father.son); 
x <- father.son$sheight
n<-length(x)

## Plot of the son's heights
g <- ggplot(data = father.son, aes(x = sheight)) 
g <- g + geom_histogram(aes(y = ..density..), fill = "lightblue", binwidth=1, colour = "black")
g <- g + geom_density(size = 2, colour = "black")
g

## Let's interpret these numbers
round(c(var(x), var(x) / n, sd(x), sd(x) / sqrt(n)),2)
