#Load the data with sqldf package to load only the dates wanted.
library("sqldf")
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

#Set the graphics device to png, and set the correct width and height.
png(file="plot2.png", width=480,height=480)

#Create the time vector. 
timeVector <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Create Plot
plot(timeVector, data$Global_active_power, type="l", col="black", xlab="", ylab="Glabe Active Power (kilowatts)")

dev.off()