library(dplyr)
library(lubridate)

# Set the local date in English
Sys.setlocale("LC_TIME", "C")

# Read data, ? means NA
x<-read.csv("./data/household_power_consumption.txt",sep=";", na.strings = "?")

# convert Date into date format
x$Date<-as.Date(x$Date, format="%d/%m/%Y")

# select dates, We will only be using data from the dates 2007-02-01 and 2007-02-02.
x<-filter(x,Date=="2007-02-01"|Date=="2007-02-02")

#paste date and time to convert to POSIXlt using strptime
x$Time<-strptime(paste(x$Date,x$Time),format="%Y-%m-%d %H:%M:%S")


#plot 4
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(x$Time,x$Global_active_power, type="l", xlab = "", ylab="Global Acive Power (kilowatts)")

plot(x$Time,x$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(x$Time,x$Sub_metering_1, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
points(x$Time,x$Sub_metering_2,type="l",col="red")
points(x$Time,x$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","blue","red"), legend=names(x[7:9]),lty=1, xjust=0,yjust=0, bty="n")
with(x,plot(Time,Global_reactive_power,xlab="datetime",type="l"))
dev.off()