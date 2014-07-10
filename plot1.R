## This script is intended for obtaining household power consumption data
## for period 01/02/2007 - 01/02/2007 
## and plotting histogram of Global active power

library(datasets)

#reading data lines corresponding to period 01/02/2007 - 01/02/2007 only
file_name <- "household_power_consumption.txt"
col_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
               "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
power_data <- read.table(file_name, header=F, col.names=col_names, sep=";", na.strings="?", 
                         skip=66637, nrows=2880, stringsAsFactors=F)

#openning png device
png("plot1.png", width=480, height=480, bg="transparent")

#plotting histogram
hist(power_data$Global_active_power, col="orangered2", breaks=12, 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

#closing device and saving png
dev.off()
