## Loading the "household_power_consumption" dataset into R      

setwd("C:/Users/David/CourseraProjects/Exploratory_Analysis/ProgAssign1")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Combine Date and Time variable, then convert to Date/Time class

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Extract only the two days of data specified for this analysis

subsetData <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

## Plot Generation

png(filename = "plot2.png")   # explicitly launch the png file device

with(subsetData, plot(x=DateTime, y=Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(subsetData, lines(x=DateTime, y=Global_active_power,type="l"))

dev.off()   # close the file device
