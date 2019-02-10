################################################################################
## Exploratory Data Analysis week 1 Plot 3
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
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

## Create a variable for time and date
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


################################################################################
# make plot1 
plot(data$DateTime, y= data$Sub_metering_1,    # load variables of interest
     type = "S",                               # set type to line graph
     xlab = "",                                # set names x-Axis
     ylab = "Energy sub metering"              # set name y-Axis
     )
points(data$DateTime, y= data$Sub_metering_2,  # load variables for second layer
     type = "S",                               # set type to line graph
     col = "red"                               # set color to red
     )                              
points(data$DateTime, y= data$Sub_metering_3,  # load variables for third layer
       type = "S",                             # set type to line graph
       col = "blue"                            # set color to blue
       )
legend("topright", lty=1, #pch = "-",  
       col = c("black", "red",  "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )


################################################################################
# save plot from screen to png-file
dev.copy(png, file = "plot3.png") 
dev.off()