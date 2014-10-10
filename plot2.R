
library("sqldf")
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)
png(file="plot2.png", width=480,height=480)

timeVector <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

plot(timeVector, data$Global_active_power, type="l", col="black", xlab="", ylab="Glabe Active Power (kilowatts)")

dev.off()