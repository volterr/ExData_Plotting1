## This script is intended for obtaining household power consumption data
## for period 01/02/2007 - 01/02/2007 
## and plotting graphics of Global active power, Voltage,
## Energy submeterings and Global reactive power through whole period

## This function plots Global active power plot
plot_global_active_power <- function(){
    #plotting Global_active_power values through all period
    with(power_data, plot(DateTime, Global_active_power, type="n",
                          , xlab="", ylab="Global Active Power"))
    with(power_data, lines(Global_active_power~DateTime))
}

## This function plots Voltage plot
plot_voltage <- function(){
    #plotting Global_active_power values through all period
    with(power_data, plot(DateTime, Voltage, type="n",
                          , xlab="datetime", ylab="Voltage"))
    with(power_data, lines(Voltage~DateTime))
}

## This function plots Energy submeterings plot
plot_energy_submeterings <- function(){
    with(power_data, plot(DateTime, Sub_metering_1, type="n",
                          , xlab="", ylab="Energy sub metering"))
    #plot lines for sub meterigns
    with(power_data, lines(Sub_metering_1~DateTime, col="black"))
    with(power_data, lines(Sub_metering_2~DateTime, col="red"))
    with(power_data, lines(Sub_metering_3~DateTime, col="blue"))
    #add legend
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=c(1,1,1), col=c("black","red","blue"), bty="n")
}

## This function plots Global reactive power plot
plot_global_reactive_power <- function(){
    #plotting Global_active_power values through all period
    with(power_data, plot(DateTime, Global_reactive_power, type="n",
                          , xlab="datetime", ylab="Global_reactive_power"))
    with(power_data, lines(Global_reactive_power~DateTime))
}



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
png("plot4.png", width=480, height=480, bg="transparent")

#prepare workspace: 2x2 board for plots with spacing
par(mfrow = c(2,2))
par(mar = c(5,4,4,2))

#plot 4 graphs on one board
plot_global_active_power()
plot_voltage()
plot_energy_submeterings()
plot_global_reactive_power()


#closing device and saving png
dev.off()
