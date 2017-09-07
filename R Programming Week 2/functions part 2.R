#functions part 2

#Definining a function
## In addition to not specifying a default value, can also set argument value to NULL.
f <- function(a, b=1, c=2, d=NULL){
        
}

#Lazy Evaluation
##Example 1
f <- function(a,b) {
        a^2
}
f(2)
f(2,2)
f(2,5)

##Example 2
f <- function(a,b) {
        print(a)
        print(b)
}
f(45,20)
##try f(45)
##Notice that "45" got printed before the error was triggered

#The "..." Argument
##... is often used when extending another function and you dont want to copy the entire argument list of the original function
myplot <- function(x,y, type = "l", ...) {
        plot(x,y, type, ...)
}

##The ... argument is also necessary when number of args passed to the function cannot be known in advance
args(paste)
args(cat)

paste("a","b", sep = ":")
paste("a", "b", se = ":")
