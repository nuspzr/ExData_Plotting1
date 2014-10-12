#In plot1.R, I have created a file that only contains the subset data.
#I will only read that file to create plot 3.

setwd("C:/R/Course4Project")
data<-read.table("data.txt",sep=";",header=T)

#Convert factor into time
date.time<-strptime(data$date.time,"%Y-%m-%d %H:%M:%S")

#Plot sub metering 1
plot(date.time,data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l", col="Black")

#Adding sub metering 2 & 3
lines(date.time,data$Sub_metering_2,col="Red")
lines(date.time,data$Sub_metering_3,col="Blue")

#Adding legend & creating a plot3 PNG file
legend("topright", col=c("black", "red", "blue"), lty=1,lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()