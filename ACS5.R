if(!file.exists("data")){
        dir.create("data")
}
# Remove the s from https
library(data.table)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile = "./data/ACS5.csv", mode='wb')
DT <- fread("./data/ACS5.csv")
#mean(DT$pwgtp15, by=DT$SEX)
system.time( mean(DT$pwgtp15, by=DT$SEX))
system.time( mean( DT[DT$SEX==1, ]$pwgtp15))
system.time( mean( DT[DT$SEX==2, ]$pwgtp15))
system.time( DT[, mean(pwgtp15), by=SEX]   )
system.time( sapply(split(DT$pwgtp15, DT$SEX) ,mean)  )
system.time(tapply(DT$pwgtp15, DT$SEX, mean))
system.time( rowMeans(DT)[DT$SEX == 1])
system.time( rowMeans(DT)[DT$SEX == 2])