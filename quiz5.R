library(httr)
oauth_endpoints("github")
myapp <- oauth_app("Akshayrajsingh",
                   key = "96df595286b29760f6f7",
                   secret = "582f3f02170615cf85269ac65f953cded9c6b35e"
)
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
datashare <- which(sapply(output, FUN=function(X) "datasharing" %in% X))
datashare
list(output[[15]]$name, output[[15]]$created_at)
library("RMySQL")
library(sqldf)
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,destfile = "acs.csv")
acs<-read.csv("acs.csv")
head(acs)

htmlUrl <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(htmlUrl)
close(htmlUrl)
head(htmlCode,c(10))
c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
SST<-read.fwf(fileUrl,skip = 4,widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
head(SST)
sum(SST[,4])












