# NB, assumes the get_data.R script has been run and the zip file extracted.

setwd(".")
data <- read.table("household_power_consumption.txt", sep=";", header=FALSE, nrows=2880, skip="66637")  # only read the lines for 2007-02-01 to 2007-02-02
labels <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(data) <- labels  # relabel the data frame column names


data$Time <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %X") # transform the time column into both date and time

png("plot2.png", width=480, height=480, units="px")
plot(data$Time, data$Global_active_power, pch="", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Time,data$Global_active_power)
dev.off()
