#Load the data with sqldf package to load only the dates wanted.
library("sqldf")
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

#Set the graphics device to png, and set the correct width and height.
png(file="plot3.png", width=480,height=480)

#Create the time vector. 
timeVector <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Create Plot
plot(timeVector, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(timeVector, data$Sub_metering_2, col="red")
lines(timeVector, data$Sub_metering_3, col="blue")

#Create legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()