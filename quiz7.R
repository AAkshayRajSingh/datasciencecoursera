download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
              , 'ACS.csv'
              , method='curl' )
ACS <- read.csv('ACS.csv')
strsplit(names(ACS),split = "wgtp")[123]

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "quiz4data.csv")
data <- read.csv("quiz4data.csv")

clean <- gsub(",","",data[,5])

mean(as.numeric(clean[1:215]),na.rm = TRUE)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "quiz4data2.csv")

data2 <- read.csv("quiz4data2.csv")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "quiz4data3.csv")

data3 <- read.csv("quiz4data3.csv")

setnames(data2, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp"))

all <- merge(data2, data3, by = "CountryCode")

table(grepl("june", tolower(all$Special.Notes)), grepl("fiscal year end", tolower(all$Special.Notes)))[4]

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
length(grep("^2012",sampleTimes))
sampleTimes[grep("^2012",sampleTimes)]
sum(weekdays(as.Date(sampleTimes[grep("^2012",sampleTimes)]))=="Monday")















