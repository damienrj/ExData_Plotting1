
library("sqldf")
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)
png(file="plot1.png", width=480,height=480)
hist(data$Global_active_power, col = "red", xlab="Glabe Active Power (kilowatts)", main="Global Active Power")

dev.off()