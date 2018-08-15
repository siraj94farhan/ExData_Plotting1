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
png("plot2.png", width = 480, height = 480)

# Plot line chart in the device
with(power_data, plot(DateTime, Global_active_power, type = "l",  ylab = "Global Active Power (kilowatts)"))

# Turn off the device
dev.off()