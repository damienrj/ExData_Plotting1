#Load the data with sqldf package to load only the dates wanted.
library("sqldf")
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

#Set the graphics device to png, and set the correct width and height.
png(file="plot4.png", width=480,height=480)

#Create the time vector. 
timeVector <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Set up multiplot figure
par(mfcol=c(2,2))

#Generate plot 1
plot(timeVector, data$Global_active_power, type="l", col="black", xlab="", ylab="Glabe Active Power")

#Generate plot 2
plot(timeVector, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(timeVector, data$Sub_metering_2, col="red")
lines(timeVector, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")

#Generate plot 3
plot(timeVector, data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")

#Generate plot 4
plot(timeVector, data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

dev.off()

