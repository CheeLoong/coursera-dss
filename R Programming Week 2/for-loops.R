# Control structures: for loops, nested for loops

#This loop takes the i variable and in each iteration of the loop gives it values 1,2,..,10, and then exists.
for (i in 1:10) {
        print(i)
}

#These three loops have the same behaviour.
x <- c("a","b","c","d")

##Example: for loop 1
for(i in 1:4) {
        print(x[i])
}

##Example: for loop 2
for(i in seq_along(x)) {
        print(x[i])
}

##Example: for loop 3
for(letter in x) {
        print(letter)
}

#Example: nested for loops
x <- matrix(1:6,2,3)

for(i in seq_len(nrow(x))) {
        for(j in seq_len(ncol(x))) {
                print(x[i,j])
        }
}
