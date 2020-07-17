
fileUrl<-"https://data.baltimorecity.gov//api//views//h5i4-nb9a//rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile =".//data//cameras.xlsx",method="curl") 
list.files(".//data")
dateDownloaded<-date()
dateDownloaded
cameraData<-read.xlsx(".//data//cameras.xlsx")
head(cameraData)

library(XML)
fileUrl<-"https://www.w3schools.com/xml/simple.xml"
doc<-xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)