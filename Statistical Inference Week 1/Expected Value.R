library(UsingR); data(galton); library(ggplot2)
library(reshape2)
longGalton <- melt(galton, measure.vars = c("child", "parent"))
g <- ggplot(longGalton, aes(x = value)) + geom_histogram(aes(y = ..density..,  fill = variable), binwidth=1, colour = "black") + geom_density(size = 2)
g <- g + facet_grid(. ~ variable)
g

## Using manipulate
        ```
library(manipulate)
myHist <- function(mu){
        g <- ggplot(galton, aes(x = child))
        g <- g + geom_histogram(fill = "salmon", 
                                binwidth=1, aes(y = ..density..), colour = "black")
        g <- g + geom_density(size = 2)
        g <- g + geom_vline(xintercept = mu, size = 2)
        mse <- round(mean((galton$child - mu)^2), 3)  
        g <- g + labs(title = paste('mu = ', mu, ' MSE = ', mse))
        g
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))
```