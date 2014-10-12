#Set local working directory
##Another individual may have a different working directory
##depending on where she stores the dataset
setwd("C:/R/Course4Project")

#Read the dataset into R
dataset<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)
names(dataset)

#Convert Date/Time into date/time classes 
converted.date<-as.Date(dataset$Date,"%d/%m/%Y")

#Identify the rows that contain the targeted dates
selected<-((converted.date=="2007-02-01")|(converted.date=="2007-02-02"))

#Subset the data
data<-subset(dataset,selected)

#Concatenate date and time. Then convert it into POSIXlt format.
z<-paste(data$Date,data$Time)
data$date.time<-strptime(z,"%d/%m/%Y %H:%M:%S")

#Plot 1 to screen device
data$Global_active_power<-as.numeric(data$Global_active_power)
hist(data$Global_active_power, breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Save Plot 1 to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

#Write the subset data into a separate document to create following plots
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
write.table(data,"data.txt",sep=";",row.names=FALSE)