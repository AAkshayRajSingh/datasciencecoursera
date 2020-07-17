fileurl<-"view-source:https://www.hotstar.com/in/sports/cricket"
download.file(fileUrl, destfile = "./data/cric.html")
doc<-htmlTreeParse(fileUrl,userInternal=T)
scores<-xpathSApply(doc,"//li[@class='score']",xmlValue)
teams<-xpathSApply(doc,"//li[@class='team']",xmlValue)
scores

teams

library(jsonlite)
jsonData<-fromJSON("https://raw.githubusercontent.com/cozy/request-json/master/package.json")
names(jsonData)
names(jsonData$owner)

myjson()