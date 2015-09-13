data <- read.csv2("household_power_consumption.txt", na.strings = "?")
data[, "Date"] <- as.Date(data[, "Date"], "%d/%m/%Y")
data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

data[, "Global_active_power"] <- as.numeric(data[, "Global_active_power"])
hist(data[,"Global_active_power"], breaks = 16, main = "Global active power", xlab = "Global active power (kilowatts)", col = "orange")
