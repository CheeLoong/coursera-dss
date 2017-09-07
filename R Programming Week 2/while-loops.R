# Control structures: while loops

#Example 1: While loops begin by testing condition, if its true, it will execute the loop body.
count <- 0
while(count < 10) {
        print(count)
        count <- count+1
}

#Example 2: While loops can test more than 1 condition
##This structure creates a loop till z arrives at less than 3 or more than 10
z <- 5 
while(z >= 3 && z <= 10){
        print(z)
        coin <- rbinom(1,1,0.5)
        
        if(coin == 1){ ##random walk
                z <- z+1
        } else {
                z <- z-1
        }
}
