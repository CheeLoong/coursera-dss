# ggplot2 (part 3)

# Continuing from previous script
library(ggplot2)
load("~/Desktop/coursera-dss/Exploratory Data Analysis Week 2/data/maacs (2).Rda")
qplot(logpm25, NocturnalSympt, data = maacs, facets = . ~ bmicat, geom = c("point", "smooth"), method = "lm") 


head(maacs[, 6:8]) 
g <- ggplot(maacs, aes(logpm25, NocturnalSympt)) 
summary(g) 
print(g)

p <- g + geom_point()
print(p) 

g + geom_point() 

# Adding More Layers: Smooth (get a sense of overall trend of the data)
g + geom_point() + geom_smooth() # low s smoother, there's a lot of noise on the boundaries because there's not much data there
g + geom_point() + geom_smooth(method = "lm") # use regression line

# Adding More Layers: Facets
g + geom_point() + facet_grid(. ~ bmicat) + geom_smooth(method = "lm") # overweight children might appear to have a stronger positive relationship in pm2.5 and nocturnal symptom

# Modifying Aesthetics
g + geom_point(color = "steelblue", size = 4, alpha = 1/2) # this assigns colour to be a constant; increase size of the points to 4 (default = 1), change alpha transparency to be 1/2

g + geom_point(aes(color = bmicat), size = 4, alpha = 1/2) # this assigns colour to a data variable

# Modifying Labels
g + geom_point(aes(color = bmicat)) + labs(title = "MAACS Cohort") + labs(x = expression("log "* PM[2.5]), y = "Nocturnal Symptoms")
theme_update(plot.title = element_text(hjust = 0.5)) # Modify main labels to be in the center
g + geom_point(aes(color = bmicat)) + labs(title = "MAACS Cohort") + labs(x = expression("log "* PM[2.5]), y = "Nocturnal Symptoms")

# Customizing the Smooth
g + geom_point(aes(color = bmicat), size = 2, alpha = 1/2) + geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE) # se = FALSE: turn off confidence interval

# Changing the Theme
g + geom_point(aes(color = bmicat)) + theme_bw(base_family = "Times")
