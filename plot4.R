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

# explicitly launch the png file device
png(filename = "plot4.png")   

## 2x2 matrix of plots
par(mfrow = c(2,2))

## Upper Left
with(subsetData, plot(x=DateTime, y=Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(subsetData, lines(x=DateTime, y=Global_active_power,type="l"))

## Upper Right
with(subsetData, plot(x=DateTime, y=Voltage, type="n", xlab="datetime"), ylab="Voltage")
with(subsetData, lines(x=DateTime, y=Voltage,type="l"))

## Lower Left
with(subsetData, plot(x=DateTime, y=Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(subsetData, lines(x=DateTime, y=Sub_metering_1,type="l"))
with(subsetData, lines(x=DateTime, y=Sub_metering_2,type="l", col="red"))
with(subsetData, lines(x=DateTime, y=Sub_metering_3,type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

## Lower Right
with(subsetData, plot(x=DateTime, y=Global_reactive_power, type="n", xlab="datetime"))
with(subsetData, lines(x=DateTime, y=Global_reactive_power,type="l"))

# close the file device
dev.off()





