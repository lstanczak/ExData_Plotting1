library(data.table)
png("plot1.png",width=480 ,height=480 )
data <- fread("household_power_consumption.txt", na.strings = "?", select = 1:3)[
  as.Date(Date, "%d/%m/%Y") %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

data[,x := as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))][,y := as.numeric(Global_active_power)]
plot(y ~ x, data, type = "l", xlab = "", ylab = "Global active power (kilowatts)")
dev.off()