#functions part 1 
#Argument Matching
##R functions arguments can be matched positionally or by name. So the following calls to sd are all equivalent.
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)
##Even though its legal, its best to follow the proper order of the arguments.

args(lm)
##The following two calls are equivalent(this is for demonstration.)
lm(data = mydata, y ~ x, model=FALSE, 1:100)
lm(y ~ x, mydata, 1:100, model=FALSE)

