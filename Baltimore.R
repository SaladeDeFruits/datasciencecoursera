if(!file.exists("data")){
        dir.create("data")
}
# Remove the s from https
library(XML)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)
scores <- xpathApply(doc,"//row/zipcode", xmlValue)
#subset scores
sum(scores == "21231")
