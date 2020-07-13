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
