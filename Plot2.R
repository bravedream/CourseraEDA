
setwd("C:/Coursera")
data<-read.delim("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
table(substr(data$Date,1,5)) #check if the date is mm-dd-yy or dd-mm-yy
mydata<-data[as.Date(data$Date,format="%d/%m/%Y")>="2007-2-1" & 
               as.Date(data$Date,format="%d/%m/%Y")<="2007-2-2",]
mydata$DateTime<-as.POSIXct(paste(mydata$Date,mydata$Time),format="%d/%m/%Y %H:%M:%S")
png(filename="Plot2.png",width=480,height=480,units="px")
plot(mydata$DateTime,mydata$Global_active_power,type="l",xlab="",ylab="Global_active_power (kilowatts)")
dev.off()