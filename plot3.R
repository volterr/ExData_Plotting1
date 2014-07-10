## This script is intended for obtaining household power consumption data
## for period 01/02/2007 - 01/02/2007 
## and plotting graphics of Global active power through whole period

library(datasets)


#reading data lines corresponding to period 01/02/2007 - 01/02/2007 only
file_name <- "household_power_consumption.txt"
col_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
               "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
power_data <- read.table(file_name, header=F, col.names=col_names, sep=";", na.strings="?", 
                         skip=66637, nrows=2880, stringsAsFactors=F)
#convert date and time to new POSIX column
power_data["DateTime"] <- as.POSIXct(paste(power_data$Date, power_data$Time), 
                                     format="%d/%m/%Y%H:%M:%S")


#uncomment following if the days of the week appear on different language
#Sys.setlocale("LC_TIME","English_United States.1252")


#openning png device
png("plot3.png", width=480, height=480, bg="transparent")


#prepare empty plot
with(power_data, plot(DateTime, Sub_metering_1, type="n",
                      , xlab="", ylab="Energy sub metering"))
#plot lines for sub meterigns
with(power_data, lines(Sub_metering_1~DateTime, col="black"))
with(power_data, lines(Sub_metering_2~DateTime, col="red"))
with(power_data, lines(Sub_metering_3~DateTime, col="blue"))
#add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=c(1,1,1), col=c("black","red","blue"))


#closing device and saving png
dev.off()
