# Control structures: repeat,next,break


#Example 1: repeat & break
x <- 1

repeat {
        print(x)
        x = x+1
        if (x == 6){
                break
        }
}


#Example 2: break statement
##break is used to exit loops when condition is met
x <- 1:5

for (val in x) {
        if (val == 3){
                break
        }
        print(val)
}

#Example 3: next statement
## next is used to skip an iteration of a loop
x <- 1:5

for (val in x) {
        if (val == 3) {
                next
        }
        print(val)
}
