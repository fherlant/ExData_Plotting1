# Script to load the dataframe needed for the 4 plots of the project

# The dataframe needed for the 4 plots is saved in a RDS file.
# If the dataframe is not available, download the raw data set if needed, 
# create the needed dataframe and save it in a RDS file.

if (!file.exists("data.rds")) {
    
    # Set the name of the file containing the data
    filename <- "household_power_consumption.txt"
    
    # If the file is not in the current directory, download it
    if(!file.exists(filename)){
        url <- paste0("https://d396qusza40orc.cloudfront.net/exdata%2F",
                      "data%2Fhousehold_power_consumption.zip")
        zip_file <- "dataset.zip"
        download.file(url, zip_file)
        unzip(zip_file)
        file.remove(zip_file)
    }
    
    # Read the file and create the dataframe
    data <- read.table(filename,
                       header = TRUE,
                       sep = ";",
                       colClasses = c(rep("character",2), rep("numeric",7)),
                       na = "?")
    
    # Create a Timestamp with the concatenation of the columns Date and Time
    data$Timestamp <- strptime(paste(data$Date,data$Time),
                               format="%d/%m/%Y %H:%M:%S")
    
    # Remove unused columns from dataset
    data$Date <- NULL
    data$Time <- NULL
    
    # Filter on the appropriate dates
    data <- data[as.Date(data$Timestamp) >= "2007-02-01"
                 & as.Date(data$Timestamp) <= "2007-02-02",]
    
    # Save dataframe in a RDS file for later use
    saveRDS(data, file = "data.rds")
    
} else {
    
    # Load the saved dataframe into R 
    data <- readRDS('data.rds')
    
}