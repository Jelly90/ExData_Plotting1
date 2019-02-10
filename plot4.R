################################################################################
## Exploratory Data Analysis week 1 Plot 4
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
data$Global_relative_power <-as.numeric(data$Global_relative_power)
data$Voltage<- as.numeric(data$Voltage)

## Create a variable for time and date
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

################################################################################
# plot to png-file
png("plot4.png", width=480, height=480) 

#arrange layout 2x2
par(mfrow = c(2,2))


# make plot4.1 
plot(data$DateTime, y= data$Global_active_power,    # load variables of interest
     type = "l",                                    # set type to line graph
     xlab = "",                                     # set names x-Axis
     ylab = "Global Active Power"                   # set name y-Axis
     
)

# make plot4.2
plot(data$DateTime, y= data$Voltage,                # load variables of interest
     type = "l",                                    # set type to line graph
     xlab = "datetime",                             # set names x-Axis
     ylab = "Voltage"                               # set name y-Axis
)

# make plot4.3
plot(data$DateTime, y= data$Sub_metering_1,         # load variables of interest
     type = "l",                                    # set type to line graph
     xlab = "",                                     # set names x-Axis
     ylab = "Energy sub metering"                   # set name y-Axis
)
points(data$DateTime, y= data$Sub_metering_2,       # load variables for second layer
       type = "l",                                  # set type to line graph
       col = "red"                                  # set color to red
)                              
points(data$DateTime, y= data$Sub_metering_3,       # load variables for third layer
       type = "l",                                  # set type to line graph
       col = "blue"                                 # set color to blue
)
legend("topright", lty=1, #pch = "-",  
       col = c("black", "red",  "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n"
)

# make plot4.4
plot(data$DateTime, y= data$Global_reactive_power,  # load variables of interest
     type = "l",                                    # set type to line graph
     xlab = "datetime",                             # set names x-Axis
     ylab = "Global_reactive_power"                 # set name y-Axis
)

dev.off()
################################################################################
