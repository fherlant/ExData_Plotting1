# Plot 3
# Energy sub-metering over time

# Load the data (a dataframe called "data")
source("load_data.R")

# Enable the png graphics device
png(filename="plot3.png", height=480, width=480, bg="transparent")

# Plot energy sub-metering No. 1
plot(data$Timestamp, data$Sub_metering_1, type="l", xlab="", col="black",
     ylab="Energy sub metering")

# Plot energy sub-metering No. 2
lines(data$Timestamp, data$Sub_metering_2, type="l", col="red")

# Plot energy sub-metering No. 3
lines(data$Timestamp, data$Sub_metering_3, type="l", col="blue")

# Add a legend in the top right corner
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1), col=c("black","red","blue"))

# Disable the png device (the plot will be saved in the current directory)
dev.off()