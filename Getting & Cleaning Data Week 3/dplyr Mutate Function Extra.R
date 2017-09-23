# dplyr Mutate Function Extra

x <- c(1.5,2.4,7.6,3.4,8.8)

class(x)

df.x <- as.data.frame(x)

mutate.df.x <- mutate(df.x, threshold = factor(1 * (x>5), labels = c("cold","hot")))
mutate.df.x
