
setwd("C:/Coursera")
data<-read.delim("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
table(substr(data$Date,1,5)) #check if the date is mm-dd-yy or dd-mm-yy
mydata<-data[as.Date(data$Date,format="%d/%m/%Y")>="2007-2-1" & 
              as.Date(data$Date,format="%d/%m/%Y")<="2007-2-2",]
nrow(mydata)
png(filename="Plot1.png",width=480,height=480,units="px")
hist(mydata$Global_active_power,col="red",xlab="Global_active_power (kilowatts)", main="Global Active Power")
dev.off()
