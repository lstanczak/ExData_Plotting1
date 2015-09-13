Sys.setlocale("LC_TIME", "English")
library(data.table)
png("plot1.png",width=480 ,height=480 )
data <- fread("household_power_consumption.txt", na.strings = "?", select = c(1,3))[
  as.Date(Date, "%d/%m/%Y") %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]
data[,hist(as.numeric(Global_active_power), main = "Global active power", 
          xlab = "Global active power (kilowatts)", col = "#FF2500")]
dev.off()