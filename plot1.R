# NB, assumes the get_data.R script has been run and the zip file extracted.

setwd(".")
data <- read.table("household_power_consumption.txt", sep=";", header=FALSE, nrows=2880, skip="66637")  # only read the lines for 2007-02-01 to 2007-02-02
labels <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(data) <- labels  # relabel the data frame column names

png("plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
