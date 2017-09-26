# Graphics Devices in R (part 1)

# How does a Plot Get Created
# Method 1: Call a plotting function

library(datasets)
with(faithful, plot(eruptions, waiting)) # Make plot appear on screen device
title(main = "Old Faithful Geyser data") # Annotate with a title

# Method 2: Launch a graphics device used for file devices
pdf(file = "myplot.pdf") # Open PDF file device; create 'myplot.pdf' in my working directory
with(faithful, plot(eruptions, waiting)) # Create plot and send to a file (no plot appears on screen)
title(main = "Old Faithful Geyser data") # Annotate plot; still nothing on the screen
dev.off() # Close the PDF file device
# Now you can view the file 'myplot.pdf' on your computer