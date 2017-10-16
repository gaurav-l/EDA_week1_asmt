#initial code to read and load data
power_data <- read.table("./Household_power_consumption/household_power_consumption.txt", sep=";", header = TRUE)
par(mfrow = c(1, 1))
final_data <- power_data[power_data$Date == "2/2/2007" | power_data$Date == "1/2/2007",]
Global_active_power_data <- final_data$Global_active_power
library("grDevices")  #Load package for PNG files

# Code to create plot 1 and transfer to png file
png(filename="Plot1.png", width = 480, height = 480)
# Generate Plot 1
hist(as.numeric(as.character(Global_active_power_data)), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()