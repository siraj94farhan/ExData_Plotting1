library(data.table)
library(dplyr)
library(lubridate)

# Please change dataset path correct path in your directory
dataset_path <- "household_power_consumption.txt"

# Set timzone to UTC
Sys.setenv(TZ = "UTC")

# Load data
power_data <- fread(dataset_path, na.strings=getOption("datatable.na.strings","?"))
# Mutate and Filter data
power_data <- power_data %>% mutate(DateTime = dmy_hms(paste(Date, Time))) %>% filter(DateTime >= "2007-02-01" & DateTime <= "2007-02-02 23:59:00")

# Open PNG device
png("plot3.png", width = 480, height = 480)

# Plot multiline chart in the device
with(power_data, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "DateTime"))
with(power_data, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(power_data, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))

# Add legend to the plot
legend("topright", legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), lty = c(1, 1, 1), col = c("black","red","blue"))

# Turn off the device
dev.off()