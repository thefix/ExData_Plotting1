#Assumes the active directory contains the script and the data file household_power_consumption.txt

#Read the data replacing the NA by ?
fulldata<-read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings="?" )

#Reformats the date
fulldata$Date<-as.Date(fulldata$Date,format="%d/%m/%Y")

#put date and time in data$Time
fulldata$Time<-as.POSIXct(paste(fulldata$Date,fulldata$Time),"%Y-%m-%d %H:%M:%S",tz="")

# Select the data for the days 2007-02-01 and 02
data1<-fulldata[fulldata$Date=="2007-02-01",]
data2<-fulldata[fulldata$Date=="2007-02-02",]

#Combines the two days in data
data<-rbind(data1,data2)

#Transforms Global_active_power into numeric
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))


# Plot 3
plot(data$Time,as.numeric(data[,7]),type="l",xlab="",ylab="Energy sub metering")
lines(data$Time,as.numeric(data[,8]),type="l",col="red")
lines(data$Time,as.numeric(data[,9]),type="l",col="blue")
legend("topright",lwd=1, pch="", col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Print the chart in a 480x 480 png file best viewed using windows photo viewer
dev.copy(png,height=480,width=480,units="px", pointsize=12, file="plot3.png")

# Close PNG device
dev.off()



