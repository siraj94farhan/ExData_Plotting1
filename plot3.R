library(data.table)
library(dplyr)
library(lubridate)

Sys.setenv(TZ = "UTC")

dataset_path <- "/Users/siraj/projects/learning/datasciencecoursera/household_power_consumption.txt"

power_data <- fread(dataset_path, na.strings=getOption("datatable.na.strings","?"))
power_data <- power_data %>% mutate(DateTime = dmy_hms(paste(Date, Time))) %>% filter(DateTime >= "2007-02-01" & DateTime <= "2007-02-02 23:59:00")

png("plot3.png", width = 480, height = 480)

plot(power_data$DateTime, power_data$Sub_metering_1, type = "l",  ylab = "Energy sub metering", xlab = "DateTime")
lines(power_data$DateTime, power_data$Sub_metering_2, type = "l", col = "red")
lines(power_data$DateTime, power_data$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), lty = c(1, 1, 1), col = c("black","red","blue"))

dev.off()