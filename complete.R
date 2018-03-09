#setwd("F:/R/R Programming/Week2-Programming/specdata")

complete <- function(directory, id=1:332) {
        df <- data.frame("id"= numeric(), "nobs"=numeric() , stringsAsFactors = FALSE)
        for(i in id){
                filename = paste0(sprintf("%03d", i),".csv")
                myData <- read.csv(filename, stringsAsFactors = FALSE)
                myData <- na.omit(myData) #Omit the NA rows in data.frame
                num <- nrow(myData)
                df[nrow(df)+1,] =c( i, num)
        }
        df
}