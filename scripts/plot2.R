# Plot 2
# Global active power over time

# Load the data (a dataframe called "data")
source("load_data.R")

# Enable the png graphics device
png(filename="plot2.png", height=480, width=480, bg="transparent")

# Plot the line
plot(data$Timestamp, data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

# Disable the png device (the plot will be saved in the current directory)
dev.off()