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
