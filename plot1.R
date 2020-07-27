# 
# #plot1
fileUrl<-"C:\\Users\\dell\\Desktop\\akshay\\DataScience\\datasciencecoursera\\household_power_consumption.txt"
data<-read.table(fileUrl,header = TRUE,sep=";",stringsAsFactors = FALSE,dec = ".")
 subsetData<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]
 png("plot1.png",width = 480,height = 480)
 globalActivePower<-as.numeric(subsetData$Global_active_power)
 
 hist(globalActivePower,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
 dev.off()

