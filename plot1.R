library(data.table)

dataset_path <- "/Users/siraj/projects/learning/datasciencecoursera/household_power_consumption.txt"

power_data <- fread(dataset_path, na.strings=getOption("datatable.na.strings","?"))

png("plot1.png", width = 480, height = 480)

hist(power_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.off()