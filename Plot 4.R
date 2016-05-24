# Plot 4
hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpc <- hpc_full[hpc_full$Date %in% c( "1/2/2007", "2/2/2007" ), ]

hpc_full$Global_active_power <- as.numeric(hpc_full$Global_active_power)/1000
hpc_full$Global_reactive_power <- as.numeric(hpc_full$Global_reactive_power)/1000
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)
hpc$Voltage <- as.numeric(hpc$Voltage)

dt <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(dt, format = "%d/%m/%Y %H:%M:%S")

head(hpc)

par(mfrow = c(2,2))

plot(hpc$DateTime, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(hpc$DateTime, hpc$Voltage, type = "l", xlab = "", ylab = "Voltage")

plot(hpc$DateTime, hpc$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red", type = "l")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 0.1, lwd = 0.1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(hpc$DateTime, hpc$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power (kilowatts)")

dev.copy(png, file = "Plot 4.png")
dev.off()