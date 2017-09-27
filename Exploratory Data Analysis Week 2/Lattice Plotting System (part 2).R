# Lattice Plotting System (part 2)

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50) # create a factor variable separating group 1 & 2
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1)) # Plot with 2 panels


# Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
        panel.xyplot(x, y, ...) # First call the default panel function for 'xyplot'
        panel.abline(h = median(y), lty = 2) # Add a horizontal line at the median
})

# Custom panel function : Regression Line
xyplot(y ~ x | f, panel = function(x, y, ...) {
        panel.xyplot(x, y, ...) # First call the default panel function for 'xyplot'
        panel.lmline(x, y, col = 2) # Overlay   a simple linear regression line
})

# Lattice system is ideal for creating conditioning plots where you examine the same kind of plot under many different conditions (Looking at a lot of data in a quick way)
