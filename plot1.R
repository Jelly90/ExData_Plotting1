################################################################################
## Exploratory Data Analysis week 1 Plot 1
################################################################################

#load libraries
library(tidyr)
library(dplyr)

# Read data from disk
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                   stringsAsFactors = FALSE)

#Formate date variable
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

# Filter dataset for days of interest
data <- filter(data, data$Date == "2007-02-01" |  data$Date == "2007-02-02")

# format variable of interest to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

################################################################################
# make plot1 
hist(data$Global_active_power,                  # load variable of interest
     col = "red",                               # set fill color of bars = red        
     xlab = "Global Active Power (kilowatts)",  # set names x-Axis
     ylab = "Frequency",                        # set name y-Axis
     main = "Global Active Power"               # set name plot
     )

################################################################################
# save plot from screen to png-file
dev.copy(png, file = "plot1.png") 
dev.off()
