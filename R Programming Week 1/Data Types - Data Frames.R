# Data Types - Data Frames

# Data Frames
## Data Frames are used to store tabular data
# - They are represented by special type of list where every element of the list has to have the same length.
# - Each element of the list can be thought of as a column and the length of each element is the number of rows.
# - Unlike matrices, data frames can store different classes of objects in each column
# - Data frames also have a special attribute called row.names
# - Data frames are usually created by calling read.table() or read.csv()
# - Can be converted to a matrix by calling data.matrix()

x <- data.frame(foo = 1:4, bar=c(T,T,F,T))
x
nrow(x)
ncol(x)
