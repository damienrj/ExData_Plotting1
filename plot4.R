
library("sqldf")
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)
png(file="plot4.png", width=480,height=480)

timeVector <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
par(mfcol=c(2,2))
plot(timeVector, data$Global_active_power, type="l", col="black", xlab="", ylab="Glabe Active Power")

plot(timeVector, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(timeVector, data$Sub_metering_2, col="red")
lines(timeVector, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")


plot(timeVector, data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(timeVector, data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

dev.off()