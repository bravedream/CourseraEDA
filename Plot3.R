
setwd("C:/Coursera")
data<-read.delim("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
table(substr(data$Date,1,5)) #check if the date is mm-dd-yy or dd-mm-yy
mydata<-data[as.Date(data$Date,format="%d/%m/%Y")>="2007-2-1" & 
               as.Date(data$Date,format="%d/%m/%Y")<="2007-2-2",]
mydata$DateTime<-as.POSIXct(paste(mydata$Date,mydata$Time),format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
png(filename="Plot3.png",width=480,height=480,units="px")
plot(mydata$DateTime,mydata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(mydata$DateTime,mydata$Sub_metering_2,col="red")
lines(mydata$DateTime,mydata$Sub_metering_3,col="blue")
legend(x="topright",lty=1,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
dev.off()
