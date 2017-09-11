# Data Types - R Objects and Attributes

# Objects
R has five basic or "atomic" classes of objects:
- character
- numeric (real numbers)
- integer
- complex
- logical (True/False)

The most basic object is a vector
- A vector can only contain objects of the same class
- BUT: The one exception is a list, which is represented as a vector but can contain objects of different classes.

Empty vectors can be created with the vector() function.
- First argument is the class of the object
- Second argument is the length of the vector

# Numbers
- Numbers in R are generally treated as numeric objects
- If want an interger, need to specify the L suffix
- There is also a special number Inf which represents infinity: e.g. 1/0
- The value NaN represent an undefinined value: e.g. 0/0; can also be thought as missing value

# Attributes
R objects can have attributes
- names, dimnames
- dimensions (e.g. matrices, arrays)
- class
- length
- other user-defined attributes/metadata
Attributes of an object can be accessed using the attributes() function.



