#R scoping rules

#Lexical scoping
##This demonstrates one function is capable of constructing many diff type of functions.
make.power <- function(n) {
        pow <- function(x) {
                x^n
        }
        pow
}

cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)

#Exploring a Function Closure
##What's in a function's environment?
ls(environment(cube))
get("n", environment(cube))

ls(environment(square))
get("n", environment(square))
 
#Lexical vs Dynamic scoping
y <- 10

f <- function(x) {
        y <- 2
        y^2 + g(x)
}

g <- function(x) {
        x*y
}

f(3) #This gives different answer with either lexical scoping / dynamic scoping


#Case when Lexical Scoping = Dynamic Scoping (Calling env = Global env)
g <- function(x){ # function defined in the global environment
        a <- 3
        x+a+y
}
g(2)

y <- 3
g(2) # called from global environment
