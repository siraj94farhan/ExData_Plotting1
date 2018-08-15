library(data.table)
library(dplyr)
library(lubridate)

Sys.setenv(TZ = "UTC")

dataset_path <- "household_power_consumption.txt"

power_data <- fread(dataset_path, na.strings=getOption("datatable.na.strings","?"))
power_data <- power_data %>% mutate(DateTime = dmy_hms(paste(Date, Time))) %>% filter(DateTime >= "2007-02-01" & DateTime <= "2007-02-02 23:59:00")

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2), mar=c(2,4,1,1))

with(power_data, plot(DateTime, Global_active_power, type = "l",  ylab = "Global Active Power"))

with(power_data, plot(DateTime, Voltage, type = "l",  ylab = "Voltage"))

with(power_data, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "DateTime"))
with(power_data, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(power_data, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))

legend("topright", legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), lty = c(1, 1, 1), col = c("black","red","blue"))

with(power_data, plot(DateTime, Global_reactive_power, type = "l",  ylab = "Global Reactive Power"))

dev.off()