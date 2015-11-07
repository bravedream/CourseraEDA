
setwd("C:/Coursera")
data<-read.delim("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
table(substr(data$Date,1,5)) #check if the date is mm-dd-yy or dd-mm-yy
mydata<-data[as.Date(data$Date,format="%d/%m/%Y")>="2007-2-1" & 
               as.Date(data$Date,format="%d/%m/%Y")<="2007-2-2",]
mydata$DateTime<-as.POSIXct(paste(mydata$Date,mydata$Time),format="%d/%m/%Y %H:%M:%S")

png(filename="Plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
plot(mydata$DateTime,mydata$Global_active_power,type="l",xlab="",ylab="Global_active_power (kilowatts)")
plot(mydata$DateTime,mydata$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(mydata$DateTime,mydata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(mydata$DateTime,mydata$Sub_metering_2,col="red")
lines(mydata$DateTime,mydata$Sub_metering_3,col="blue")
legend(x="topright",lty=1,bty="n",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
plot(mydata$DateTime,mydata$Global_reactive_power,type="l",xlab="datetime",ylab="Energy sub metering")
dev.off()

