
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
              , 'ACS.csv'
              , method='curl' )
ACS <- read.csv('ACS.csv')

agricultureLogical <- ACS$ACR == 3 & ACS$AGS == 6
head(which(agricultureLogical), 3)

library('jpeg')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg','jeff.jpg',mode='wb')
pic<-jpeg::readJPEG('jeff.jpg',native=TRUE)
quantile(pic,c(0.3,0.8))

library(data.table)
FGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=4
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
)
FEDSTATS_Country <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
)

mergedDT <- merge(FGDP, FEDSTATS_Country, by = 'CountryCode')
nrow(mergedDT)
mergedDT[order(-Rank)][13,.(Economy)]












