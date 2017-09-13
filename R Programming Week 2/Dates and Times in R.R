# Dates and Times in R
## R has developed a special representation of dates and times

# - Dates are represented by the Date class.
# - Times are represented by the POSIXct or the POSIXlt class
# - Dates are stored internally as the number of days since 1970-01-01
# - Times are stored internally as the number of seconds since 1970-01-01.

# Dates in R
## Dates are represented by the Date class and ca be coerced from a characer string using the as.Date() function

x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))

# Times in R
## POSIXct is just a very large integer under the hood; useful type of class when storing times in something like a dataframe
## POSIXlt is a list underneath is stores a bunch of other useful information like the day of the week, day of the year, month, day of the month.
## There are a number of generic functions that work on dates and times
# - weekdays: give the day of the week
# - months: give the month time
# -quarters: give the quarter numbers ("Q1,Q2,Q3,Q4")


## Times can be coerced from a character string using the as.POSIXlt or as.POSIXct function
x <- Sys.time()
x
p <- as.POSIXlt(x) # this is a list, you can unclass it and look at the underlying elements
names(unclass(p))
p$sec

x <- Sys.time()
x # Already in 'POSIXct' format
unclass(x) #this shows number of seconds since 1970-01-01

## Finally, there is the strptime function in case your dates are written in a different format

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
datestring
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)
?strptime # for more information

# Operations on Dates and Times
## You can use mathematical operations on dates and times. just + and -.
x <- as.Date("2012-01-01") #POSIXct
y <- strptime("9 January 2011 11:34:21", "%d %b %Y %H:%M:%S") #POSIXlt
# x - y # gives error because of different class

x <- as.POSIXlt(x)
x-y #shows time difference

## Even keep tracks of leap years, leap seconds, daylight savings, and time zones.
x <- as.Date("2012-03-01") ; y <- as.Date("2012-02-28")
x-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz="GMT")
y-x
