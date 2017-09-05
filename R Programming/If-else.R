#Control structures: If, If-else, Nested If-else
# Example: if statement
x <- 5
if (x > 0){
        print("Positive number")
}

# Example: if..else statement
x <- -5
if (x > 0){
        print("Non-negative number")
} else {
        print("Negative number")
}
##Alternatively, the line above can also be written in one line
if (x > 0) print("Non-negative number") else print("Negative number")
##A different construct would be: 
x <- -5
y <- if(x > 0) 5 else 6
y

#Example: nested if..else statement 
x <- 0
if (x < 0) {
        print("Negative number")
} else if (x > 0) {
        print("Positive number")
} else {
        print("Zero")
}
