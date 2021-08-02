householdpower <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(householdpower) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subhousepower <- subset(householdpower, householdpower$Date == "1/2/2007" | householdpower$Date == "2/2/2007")

png("plot1.png")
hist(as.numeric(subhousepower$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()
