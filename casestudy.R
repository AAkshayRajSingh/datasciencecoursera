pm0<-read.table("RD_501_88101_1999-0.txt",comment.char = "#",header=FALSE,sep="|",na.strings = "")
dim(pm0)
head(pm0)
cnames<-readLines("RD_501_88101_1999-0.txt",1)
cnames
cnames<-strsplit(cnames,"|",fixed=TRUE)
cnames
names(pm0)<-cnames[[1]]
head(pm0)
names(pm0)<-make.names(cnames[[1]])
head(pm0)

pm1<-read.table("RD_501_88101_2012-0.txt",comment.char = "#",header=FALSE,sep="|",na.strings = "")
x0<-pm0$Sample.Value
dim(pm1)
names(pm1)<-make.names(cnames[[1]])
names(pm1)
head(pm1)
x1<-pm1$Sample.Value
class(x1)
str(x1)
summary(x1)

summary(x0)
mean(is.na(x1))
boxplot(x0,x1)
boxplot(log10(x0),log10(x1))
summary(x1)        
negative<-x1<0
str(negative)
sum(negative,na.rm = TRUE)
mean(negative,na.rm = TRUE)
dates<-pm1$Date
str(dates)
dates<-as.Date(as.character(dates),"%Y%m%d")
head(dates)
hist(dates,"month")
hist(dates[negative],"month")
site0<-unique(subset(pm0,State.Code==36,c(County.Code,Site.ID)))
site1<-unique(subset(pm1,State.Code==36,c(County.Code,Site.ID)))
head(site0)
site<-paste(site0[,1],site0[,2],sep=".")
site1<-paste(site1[,1],site1[,2],sep=".")
str(site)
str(site1)
both<-intersect(site,site1)
both
pm0$countysite<-with(pm0,paste(County.Code,Site.ID,sep="."))
pm1$countysite<-with(pm1,paste(County.Code,Site.ID,sep="."))
cnt0<-subset(pm0,State.Code==36&countysite%in%both)
cnt1<-subset(pm1,State.Code==36&countysite%in%both)
head(cnt0)
split(cnt0,cnt0$countysite)
sapply(split(cnt1,cnt1$countysite),nrow)
pm1sub<-subset(pm1,State.Code==36&County.Code==63&Site.ID==2008)
pm0sub<-subset(pm0,State.Code==36&County.Code==63&Site.ID==2008)
dim(pm1sub)
dim(pm0sub)
dates1<-pm1sub$Date
x1sub<-pm1sub$Sample.Value
plot(dates1,x1sub)
dates1<-as.Date(as.character(dates1),"%Y%m%d")
plot(dates1,x1sub)
str(dates1)
dates0<-pm0sub$Date
x0sub<-pm0sub$Sample.Value
plot(dates0,x0sub)
dates0<-as.Date(as.character(dates0),"%Y%m%d")
plot(dates0,x0sub)
str(dates0)
par(mfrow=c(1,2),mar=c(4,4,2,1))
plot(dates0,x0sub,pch=19)
abline(h=median(x0sub,na.rm=T))
plot(dates1,x1sub,pch=19)
abline(h=median(x1sub,na.rm=T))
range(x0sub,x1sub,na.rm = T)
rng<-range(x0sub,x1sub,na.rm = T)
par(mfrow=c(1,2))
plot(dates0,x0sub,pch=20,ylim = rng)
abline(h=median(x0sub,na.rm=T))
plot(dates1,x1sub,pch=20,ylim = rng)
abline(h=median(x1sub,na.rm=T))
head(pm0)
mn0<-with(pm0,tapply(Sample.Value,State.Code,mean,na.rm=T))
str(mn0)
summary(mn0)
d0<-data.frame(state=names(mn0),mean=mn0)
d1<-data.frame(state=names(mn1),mean=mn1)
head(d0)
head(d1)
mrg<-merge(d0,d1,by="state")
mrg
par(mfrow=c(1,1))
with(mrg,plot(rep(1999,52),mrg[,2],xlim=c(1998,2019)))
with(mrg,points(rep(2012,52),mrg[,3]))
segments(rep(1999,52),mrg[,2],rep(2012,52),mrg[,3])
