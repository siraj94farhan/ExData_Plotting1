library(data.table)

dataset_path <- "/Users/siraj/projects/learning/datasciencecoursera/household_power_consumption.txt"

power_data <- fread(dataset_path, na.strings=getOption("datatable.na.strings","?"))