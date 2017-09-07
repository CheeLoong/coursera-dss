#R console input and evaluation

#Entering input
##At the R prompt, we type expressions, the "<-" is the assignment operator
x <- 1 # assigns a value to a symbol
x #x is considered an R object that is a numeric object that has one element
#in another word, it's a numeric vector where the first element is the number one

msg <- "hello" #assigning value of the string 'hello' to msg, now this is a character vector
#the first value of this character vector is 'hello', can add more character into this character vector
msg

#Evaluation
##When a complete expression is entered at the prompt, it is evaluated and the result of the evalauted expression is returned
x <- 5 #nothing printed
x #auto printing occurs        
print(x) #explicit printing
##The [1] indicates that x is a vector and 5 is its first element

#Printing
##The : operator is used to create integer sequences.
x <- 1:20 #In this case it's an integer vector
x
