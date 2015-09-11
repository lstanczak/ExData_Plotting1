library(data.table)
png("plot3.png",width=480 ,height=480 )
data <- fread("household_power_consumption.txt", na.strings = "?", select = c(1,2,7,8,9))[
  as.Date(Date, "%d/%m/%Y") %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

data[,x := as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))][
  ,y1 := as.numeric(Sub_metering_1)][
  ,y2 := as.numeric(Sub_metering_2)][
  ,y3 := as.numeric(Sub_metering_3)]
plot(y1 ~ x, data, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(y2 ~ x, data, type = "l", col = "red")
lines(y3 ~ x, data, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col = c("black", "red", "blue"))
dev.off()