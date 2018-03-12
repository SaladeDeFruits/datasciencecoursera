if(!file.exists("data")){
        dir.create("data")
}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileurl, destfile = "./data/gasdata.xlsx", mode='wb')
library(xlsx)
dat <- read.xlsx("./data/gasdata.xlsx", sheetIndex=1, header= TRUE, colIndex = 7:15 , rowIndex = 18:23 )
sum(dat$Zip*dat$Ext,na.rm=T)
