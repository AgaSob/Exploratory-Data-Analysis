# Plot 2
hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpc <- hpc_full[hpc_full$Date %in% c( "1/2/2007", "2/2/2007" ), ]

hpc$Global_active_power <- as.numeric(hpc$Global_active_power)/1000
dt <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(dt, format = "%d/%m/%Y %H:%M:%S")

head(hpc)

plot(hpc$DateTime, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "Plot 2.png")
dev.off()
