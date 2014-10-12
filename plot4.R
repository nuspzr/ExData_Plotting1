#In plot1.R, I have created a file that only contains the subset data.
#I will only read that file to create plot 3.

setwd("C:/R/Course4Project")
data<-read.table("data.txt",sep=";",header=T)

#Convert factor into time
date.time<-strptime(data$date.time,"%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2),mar=c(4,4,2,2))

#Topleft plot
plot(date.time, data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

#Topright plot
plot(date.time,data$Voltage,type="l",ylab="Voltage", xlab="")

#Bottomleft plot
plot(date.time,data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l", col="Black")
lines(date.time,data$Sub_metering_2,col="Red")
lines(date.time,data$Sub_metering_3,col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1,bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8)

#Bottomright plot
plot(date.time, data$Global_reactive_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

#Create plot 4
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()