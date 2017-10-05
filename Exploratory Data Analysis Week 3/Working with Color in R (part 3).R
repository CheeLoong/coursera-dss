# Working with Color in R (part 2).R

# RColorBrewer and colorRampPalette

library(RColorBrewer)
cols <- brewer.pal(3, "BuGn") # First argument is the number of colours you want in your palette, second argument is the name of the pallette
cols

pal <- colorRampPalette(cols) # pass palette of colours into colorRampPalette function
image(volcano, col = pal(20))

# The smoothScatter function (creates 2D histogram)
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y)
