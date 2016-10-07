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

#PLOT 1
png(file="plot1.png",width=480,height=480)
hist(x$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()