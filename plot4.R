#initial code to read and load data
power_data <- read.table("./Household_power_consumption/household_power_consumption.txt", sep=";", header = TRUE)
par(mfrow = c(1, 1))
final_data <- power_data[power_data$Date == "2/2/2007" | power_data$Date == "1/2/2007",]
Global_active_power_data <- final_data$Global_active_power
library("grDevices")  #Load package for PNG files

# Code to create plot 4 and transfer to png file
date_with_time <- strptime(paste(final_data$Date, final_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png(filename="Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(date_with_time, as.numeric(as.character(final_data$Global_active_power)), type="l", xlab="", ylab="Global Active Power")
plot(date_with_time, as.numeric(as.character(final_data$Voltage)), type="l", xlab="datetime", ylab="Voltage")
plot(date_with_time, as.numeric(as.character(final_data$Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering")
points(date_with_time, as.numeric(as.character(final_data$Sub_metering_2)), type="l", col ="red")
points(date_with_time, as.numeric(as.character(final_data$Sub_metering_3)), type="l", col ="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue") ,lty = 1, cex = .3)
plot(date_with_time, as.numeric(as.character(final_data$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_Reactive_Power")
dev.off()