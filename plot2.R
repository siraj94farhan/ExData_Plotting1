library(data.table)
library(dplyr)
library(lubridate)

Sys.setenv(TZ = "UTC")

dataset_path <- "household_power_consumption.txt"

power_data <- fread(dataset_path, na.strings=getOption("datatable.na.strings","?"))
power_data <- power_data %>% mutate(DateTime = dmy_hms(paste(Date, Time))) %>% filter(DateTime >= "2007-02-01" & DateTime <= "2007-02-02 23:59:00")

png("plot2.png", width = 480, height = 480)

with(power_data, plot(DateTime, Global_active_power, type = "l",  ylab = "Global Active Power (kilowatts)"))

dev.off()