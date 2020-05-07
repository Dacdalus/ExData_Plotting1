library(data.table)
# Read and set up data
data <- fread("household_power_consumption.txt")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_plot <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plot 1
png("plot1.png", width= 480, height= 480)
hist(as.numeric(data_plot$Global_active_power), 
     main= "Global Active Power", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", col= "Red")
dev.off()