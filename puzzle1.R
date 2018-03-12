# setwd("F:/R/03.Getting and Cleaning Data/week1-programming/week1-programming")
if(!file.exists("data")){
        dir.create("data")
}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile = "./data/puzzle1.csv")
list.files("./data")
mydata <- read.csv("./data/puzzle1.csv", header = TRUE)
length(which(mydata$VAL==24))