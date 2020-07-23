camerasData<-read.csv("./data/restaurants.csv")
names(camerasData)
camerasData
tolower(names(camerasData))
splitNames=strsplit(names(camerasData),"\\.")
splitNames[[7]]
splitNames[[5]]
mylist<-list(letters=c("A","b","c"),numbers=1:4,matrix(1:25,ncol=5))
head(mylist)
mylist$letters
mylist[[3]]
length(grep("Remington",camerasData$neighborhood,value = TRUE))
library(stringr)
nchar("jeff leark")
substr("jeff Leark",1,4)
paste0("dfgh", "ertyui")
str_trim("jahhn             ")
d1=date()
d1
class(d1)
d2=Sys.Date()
d2
class(d2)        
format(d2,"%A %B %d %Y")        
weekdays(d2)        
julian(d2)        
library(lubridate);ymd("20101008")       
mdy("08/04/2014")
        
        
        
        
        

















