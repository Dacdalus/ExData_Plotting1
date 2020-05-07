library(data.table)
# Read and set up data
data <- fread("household_power_consumption.txt")
data$Time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_plot <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plot 3
png("plot3.png", width= 480, height= 480)
plot(data_plot$Time, data_plot$Sub_metering_1, type= "l", xlab= "", ylab= "Energy sub metering")
lines(data_plot$Time, data_plot$Sub_metering_2,col= "red")
lines(data_plot$Time, data_plot$Sub_metering_3,col= "blue")
legend("topright", col= c("black","red","blue"),
       c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "), 
       lty= c(1,1), lwd= c(1,1))
dev.off()