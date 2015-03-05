# Plot 4
# Energy, voltage, and power over time

# Load the data (a dataframe called "data")
source("load_data.R")

# Enable the png graphics device
png(filename="plot4.png", height=480, width=480, bg="transparent")

# Create a 2x2 matrix of plots
par(mfrow=c(2,2))

# ------------------- SUBPLOT 1 - ACTIVE POWER OVER TIME ----------------------#
plot(data$Timestamp, data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power")

# --------------------- SUBPLOT 2 - VOLTAGE OVER TIME -------------------------#
plot(data$Timestamp, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# ------------------ SUBPLOT 3 - SUB-METERING OVER TIME -----------------------#

# Plot energy sub-metering No. 1
plot(data$Timestamp, data$Sub_metering_1, type="l", xlab="", col="black",
     ylab="Energy sub metering")

# Plot energy sub-metering No. 2
lines(data$Timestamp, data$Sub_metering_2, type="l", col="red")

# Plot energy sub-metering No. 3
lines(data$Timestamp, data$Sub_metering_3, type="l", col="blue")

# Add a legend in the top right corner
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1), col=c("black","red","blue"), bty="n")

# ------------------ SUBPLOT 4 - REACTIVE POWER OVER TIME ---------------------#
plot(data$Timestamp, data$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

# Disable the png device (the plot will be saved in the current directory)
dev.off()