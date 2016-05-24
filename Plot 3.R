# Plot 3
hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpc <- hpc_full[hpc_full$Date %in% c( "1/2/2007", "2/2/2007" ), ]

hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)
dt <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(dt, format = "%d/%m/%Y %H:%M:%S")

head(hpc)

plot(hpc$DateTime, hpc$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red", type = "l")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "Plot 3.png")
dev.off()