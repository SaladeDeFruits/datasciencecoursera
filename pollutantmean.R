#setwd("F:/R/R Programming/Week2-Programming/specdata")
pollutantmean <- function(directory, pollutant="sulfate", id = 1:332){
        df <- data.frame( "Date"= character(), "sulfate"=numeric(), "nitrate"=numeric(), "ID"=integer(), stringsAsFactors = FALSE )
        
        for(i in id){
                filename = paste0(sprintf("%03d", i),".csv")
                myData <- read.csv(filename, stringsAsFactors = FALSE)
                df <- rbind(df, myData)
        }
        mean(df[[pollutant]], na.rm = TRUE)
}


