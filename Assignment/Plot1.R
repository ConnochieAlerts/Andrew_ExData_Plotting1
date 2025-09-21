data <- read.table("household_power_consumption.txt", header = TRUE,
sep = ";",
stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)
png("plot1.png", width = 480, height = 480)
plot(plot1, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col  = "red")
dev.off()