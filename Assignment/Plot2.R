data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";",
                   stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)
datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format = "%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot (datetime, subset_data$Global_active_power, type = "l",
      xlab = "", ylab = "Global Active Power (kilowatts)",
      xaxt = "n")
tick_dates <- seq(min(subset_data$Date), max(subset_data$Date) + 1, by = "day")
axis(1, at = as.POSIXct(tick_dates), labels = format(tick_dates, "%a"))
dev.off()

