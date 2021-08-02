householdpower <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(householdpower) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subhousepower <- subset(householdpower, householdpower$Date == "1/2/2007" | householdpower$Date == "2/2/2007")


subhousepower$Date <- as.Date(subhousepower$Date, format="%d/%m/%Y")
subhousepower$Time <- strptime(subhousepower$Time, format="%H:%M:%S")
subhousepower[1:1440,"Time"] <- format(subhousepower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subhousepower[1441:2880,"Time"] <- format(subhousepower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))

with(subhousepower, {
        plot(subhousepower$Time,as.numeric(subhousepower$Global_active_power),type="l",  xlab="",ylab="Global Active Power")  
        plot(subhousepower$Time,as.numeric(subhousepower$Voltage), type="l",xlab="datetime",ylab="Voltage")
        plot(subhousepower$Time,subhousepower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(subhousepower,lines(Time,as.numeric(Sub_metering_1), col = "black"))
        with(subhousepower,lines(Time,as.numeric(Sub_metering_2), col = "red"))
        with(subhousepower,lines(Time,as.numeric(Sub_metering_3), col = "blue"))
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
        plot(subhousepower$Time,as.numeric(subhousepower$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()
