# Plot 1
hpc_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpc_full$Date <- as.Date(hpc_full$Date, format = "%d/%m/%Y")
hpc <- hpc_full[hpc_full$Date >= "2007-02-01" & hpc_full$Date <= "2007-02-02", ]

hpc$Global_active_power <- as.numeric(hpc$Global_active_power)/1000

hist(hpc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file = "Plot 1.png")
dev.off()
