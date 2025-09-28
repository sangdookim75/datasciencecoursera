data <- read.table("~/household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?", stringsAsFactors = FALSE)

data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))


plot(datetime, as.numeric(data$Global_active_power), type = "l",xlab = "", ylab = "Global Active Power")

plot(datetime, as.numeric(data$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(data$Sub_metering_2), col = "red")
lines(datetime, as.numeric(data$Sub_metering_3), col = "blue")
legend("topright", col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")

plot(datetime, as.numeric(data$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global Reactive Power")

png("plot4.png", width = 480, height = 480)

dev.off()