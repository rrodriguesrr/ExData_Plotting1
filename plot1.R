setwd("C:/Users/rrodriguesrr/Documents/Courses/Data Science/4 - Exploratory Data Analysis/Working Directory")

library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, na.strings = "?")%>%
    mutate(Date = as.Date(strptime(as.character(Date), "%d/%m/%Y"))) %>%
    mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S')))%>%
    mutate(Global_active_power = as.numeric(Global_active_power)) %>%
    mutate(Global_reactive_power = as.numeric(Global_reactive_power)) %>%
    mutate(Voltage = as.numeric(Voltage)) %>%
    mutate(Global_intensity = as.numeric(Global_intensity)) %>%
    mutate(Sub_metering_1 = as.numeric(Sub_metering_1)) %>%
    mutate(Sub_metering_2 = as.numeric(Sub_metering_2)) %>%
    mutate(Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
    filter(Date >= "2007-02-01", Date <= "2007-02-02")

png("plot1.png",  width = 480, height = 480, units = "px")

hist(data$Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power(kilowatts)")

dev.off()
