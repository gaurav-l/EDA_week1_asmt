#initial code to read and load data
power_data <- read.table("./Household_power_consumption/household_power_consumption.txt", sep=";", header = TRUE)
par(mfrow = c(1, 1))
final_data <- power_data[power_data$Date == "2/2/2007" | power_data$Date == "1/2/2007",]
library("grDevices")  #Load package for PNG files


# Code to create plot 2 and transfer to png file
date_with_time <- strptime(paste(final_data$Date, final_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_active_power_data <- as.numeric(as.character(final_data$Global_active_power))
png(filename="Plot2.png", width = 480, height = 480)
plot(date_with_time, Global_active_power_data, xlab="", ylab="Global Active Power (kilowatts)",type="l")
dev.off()