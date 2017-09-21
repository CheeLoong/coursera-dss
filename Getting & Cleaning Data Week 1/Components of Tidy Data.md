# Components of Tidy Data

# The four things you should have
1. The raw data
2. A tidy data set
3. A code book describing each variable and its values in the tidy data set
4. An explicit and exact recipe you used to go form 1 -> 2,3.

# The raw data
- The strange binary file your measurement machine spits out
- The unformatted Excel file with 10 worksheets the company you contracted sent you
- The complicated JSON data you got from scraping the Twitter API
- The hand-entered numbers you collected looking through a microscope

## You know the raw data is in the right format if you
1. Ran no software on the data
2. Did not manipulate any of the numbers in the data
3. Did not remove any data from the data set
4. You did not summarize the data in any way


# The tidy data
1. Each variable you measure should be in one column
2. Each different observation of that variable should be in a different row
3. There should be one table for each "kind" of variable
4. If you have multiple tables, they should include a column in the table allows them to be linked

# The code book
1. Information about the variables (including units! e.g. currency type) in the data set not contained in the tidy data
2. Information about the summary choices you made (e.g. mean/median)
3. Information about the experimental study design you used. (the way you collected these data)

Some other tips
- A common format for this doc is a Word/text file
- There should be a section called "study design" that has a thorough description of how you collected the data
- There must be a section called "code book" that describes each variable and its units.

# The instruction list
- Ideally a computer script (in R)
- The input for the script is the raw data
- The output for the script is the processed, tidy data
- There are no parameters to the script (i.e. you fixed everything that you've done after you done all the processing)
In some cases it will not be possible to script every step. In that case you should provide instructions like:
1. Step 1 - take the raw file, run version 3.1.2 of summarized software with parameters a=1,b=2,c=3
2. Step 2 - run the software separately for each sample
3. Step 3 - take column three of outputfule.out for each sample and that is the corresponding row in the output data set