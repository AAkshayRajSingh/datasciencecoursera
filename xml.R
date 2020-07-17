library(XML)
fileUrl<-"http://www.w3schools.com/xml/simple.xml"
download.file(fileUrl, destfile = "./data/simple.xml")
doc <- xmlTreeParse("./data/simple.xml", useInternalNodes = TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode,xmlValue)
xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)
