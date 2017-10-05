# Working with Color in R (part 1)

# Colour Palette Utilities in R
## (1) colorRamp: Take a palette of colors and return a function that takes values between 0 and 1, indicating the extremes of the colour palette
## (2) colorRampPalette: Take a palette of colors and return a function that takes integer arguments and returns a vector of colors interpolating the palette (like heat.colors or topo.colors)

# colorRamp
pal <- colorRamp(c("red", "blue"))
pal(0) # First column is red, second column is blue, third column is green; the 255 is the maximum value for these colours
pal(1) # This indicates pal(1) is blue in colour
pal(0.5) # This indicate 0.5 red and 0.5 blue which results in green colour
## there's no green in any of these calls because interpolating red and blue, you don't encounter green

pal(seq(0,1, len = 10))

# colorRampPalette (similar to colorRamp but returns different function)
pal <- colorRampPalette(c("red", "yellow"))
pal(2) # Gives 6-characters vector; The first two character represent red, the second two represent green, and the third two represent blue, F is the largest number in hexadecimal, FF means a maximum for red. FF0000 returns red. FF-FF-00 gives maximum red and maximum green and none blue, so this gives yellow.
pal(10)
