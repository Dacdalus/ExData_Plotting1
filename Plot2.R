library(data.table)
# Read and set up data
data <- fread("household_power_consumption.txt")
data$Time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_plot <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plot 2
png("plot2.png", width=480, height=480)
plot(data_plot$Time, data_plot$Global_active_power, 
     type= "l", xlab= "", ylab= "Global Active Power (kilowatts)")
dev.off()