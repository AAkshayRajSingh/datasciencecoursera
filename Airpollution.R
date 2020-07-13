data2<-read.csv("C:\\Users\\dell\\Desktop\\akshay\\DataScience\\datasciencecoursera\\specdata\\001.csv",header=T)
data2
mean(data2[[""]],na.rm=T)


## pollutantmean function
pollutantmean<-function(directory,pollutant,id=1:332)
{
        filelist<-list.files(path = directory,pattern = ".csv",full.names = T)
        values<-numeric()
        for(i in id)
        {
                data3<-read.csv(filelist[i])
                values<-c(values,data3[[pollutant]])
                          
        }
        mean(values,na.rm=T)
}
pollutantmean("/Users/dell/Desktop/akshay/DataScience/datasciencecoursera/specdata","nitrate")


## complete function
complete<-function(directory,id=1:332){
        filelist<-list.files(path="specdata",pattern = ".csv",full.names = T)
        nobs<-numeric()
        for(i in id){
                data<-read.csv(filelist[i])
                nobs<-c(nobs,sum(complete.cases(data)))
        }
        data.frame(id,nobs)
}

###corr function
corr<-function(directory,threshold=0){
        filelist<-list.files(path=directory,pattern = ".csv",full.names = T)
        df<-complete(directory)
        ids<-df[df["nobs"]>threshold,]$id
        corrr<-numeric()
        for(i in ids){
                data<-read.csv(filelist[i])
                dff<-data[complete.cases(data),]
                corrr<-c(corrr,cor(dff$sulfate,dff$nitrate))
        }
        return(corrr)
}
