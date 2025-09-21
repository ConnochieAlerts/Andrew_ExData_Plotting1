data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";",
                   stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)
datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format = "%Y-%m-%d %H:%M:%S")
png("plot4-2x2.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot (datetime, subset_data$Global_active_power, type = "l",
      xlab = "", ylab = "Global Active Power (kilowatts)",
      xaxt = "n")
tick_dates <- seq(min(subset_data$Date), max(subset_data$Date) + 1, by = "day")
axis(1, at = as.POSIXct(tick_dates), labels = format(tick_dates, "%a"))
plot(datetime, subset_data$Voltage, type = "l", xlab = "", ylab = "Voltage", xaxt = "n")
tick_dates <- seq(min(subset_data$Date), max(subset_data$Date) + 1, by = "day")
axis(1, at = as.POSIXct(tick_dates), labels = format(tick_dates, "%a"))
plot(datetime, subset_data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", col = "black")
lines(datetime, subset_data$Sub_metering_2, col = "red")
lines(datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
tick_dates <- seq(min(subset_data$Date), max(subset_data$Date) + 1, by = "day")
axis(1, at = as.POSIXct(tick_dates), labels = format(tick_dates, "%a"))
plot (datetime, subset_data$Global_reactive_power, type = "l",
      xlab = "", ylab = "Global_reactive_power",
      xaxt = "n")
tick_dates <- seq(min(subset_data$Date), max(subset_data$Date) + 1, by = "day")
axis(1, at = as.POSIXct(tick_dates), labels = format(tick_dates, "%a"))
dev.off()