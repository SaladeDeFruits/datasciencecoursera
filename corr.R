#setwd("F:/R/R Programming/Week2-Programming/specdata")
corr <- function(directory, threshold =0) {
        df <- data.frame( "Date"= character(), "sulfate"=numeric(), "nitrate"=numeric(), "ID"=integer(), stringsAsFactors = FALSE )
        cr =c()
        id =1:332
        for(i in id){
                filename = paste0(sprintf("%03d", i),".csv")
                myData <- read.csv(filename, stringsAsFactors = FALSE)
                myData <- na.omit(myData) #Omit the NA rows in data.frame
                num <- nrow(myData)
                if( num >= threshold){
                    covariance = cor(myData$sulfate, myData$nitrate)
                    cr<-c(cr, covariance)
                }
        }
        cr
}