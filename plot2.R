################################################################################
## Exploratory Data Analysis week 1 Plot 2
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

## Create a variable for time and date
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

################################################################################
# make plot1 
plot(data$DateTime, y= data$Global_active_power,      # load variables of interest
     type = "S",                                      # set type to line graph
     xlab = "",                                       # set names x-Axis
     ylab = "Global Active Power (kilowatts)"         # set name y-Axis

)

################################################################################
# save plot from screen to png-file
dev.copy(png, file = "plot2.png") 
dev.off()
