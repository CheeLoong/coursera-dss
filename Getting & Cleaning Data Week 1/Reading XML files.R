# Reading XML files

# Extra: Fix tar:Failed to set default locale after installing packages
system('defaults write org.R-project.R force.LANG en_US.UTF-8')

# Reading XML files into R
library(XML)
library(httr)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(rawToChar(GET(fileUrl)$content), useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

# Directly access parts of the XML document
rootNode[[1]]
rootNode[[1]] [[1]]

# Programmatically extract parts of the file
xmlSApply(rootNode,xmlValue)

# Get the items on the menu and the prices using xpath
xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)

# Extract content by attributes
fileUrl <- "http://www.espn.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(rawToChar(GET(fileUrl)$content), useInternal=TRUE)
scores <- xpathSApply(doc, "//div[@class='game-info']",xmlValue)
teams <- xpathSApply(doc, "//div[@class='team-name']",xmlValue)
scores
teams # supposed to show the teams, but @class='team-name' is no longer valid
