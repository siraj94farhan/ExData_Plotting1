library(data.table)
library(dplyr)
library(lubridate)

dataset_path <- "/Users/siraj/projects/learning/datasciencecoursera/household_power_consumption.txt"

power_data <- fread(dataset_path, na.strings=getOption("datatable.na.strings","?"))
power_data <- power_data %>% mutate(Date = dmy(Date)) %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot1.png", width = 480, height = 480)

hist(power_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.off()