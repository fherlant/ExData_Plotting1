# Plot 1
# Histogram of global active power

# Load the data (a dataframe called "data")
source("load_data.R")

# Enable the png graphics device
png(filename="plot1.png", height=480, width=480, bg="transparent")

# Plot the histogram
hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Disable the png device (the plot will be saved in the current directory)
dev.off()