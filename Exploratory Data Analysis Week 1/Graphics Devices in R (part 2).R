# Graphics Devices in R (part 2)

# Copying Plots (not exact operation, result may not be identical)
library(datasets)
with(faithful, plot(eruptions, waiting)) # Create plot on the screen device
title(main = "Old Faithful Geyser data") # Add a main title
dev.copy(png, file = "geyserplot.png") # Copy my plot to a PNG file
dev.off()
