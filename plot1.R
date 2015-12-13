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

# Histogram for plot 1
hist(data$Global_active_power,main="Global Active Power",bg="white",col="orangered",xlab="Global Active Power (kilowatts)")

#Print the chart in a 480x 480 png file best viewed using windows photo viewer
dev.copy(png,height=480,width=480,units="px", pointsize=12, file="plot1.png")

# Close PNG device
dev.off()

