#In plot1.R, I have created a file that only contains the subset data.
#I will only read that file to create plot 2.

setwd("C:/R/Course4Project")
data<-read.table("data.txt",sep=";",header=T)

#Convert factor into time
date.time<-strptime(data$date.time,"%Y-%m-%d %H:%M:%S")

#Plot 2
plot(date.time, data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()