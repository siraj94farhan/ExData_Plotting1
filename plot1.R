library(data.table)
library(dplyr)
library(lubridate)

# Please change dataset path correct path in your directory
dataset_path <- "household_power_consumption.txt"

# Load data
power_data <- fread(dataset_path, na.strings=getOption("datatable.na.strings","?"))
# Mutate and Filter data
power_data <- power_data %>% mutate(Date = dmy(Date)) %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

# Open PNG device
png("plot1.png", width = 480, height = 480)

# Plot Histogram in the device
hist(power_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

# turn off device
dev.off()