test <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
f <- paste(test$Date, test$Time)
g <- strptime(f, "%d/%m/%Y %H:%M:%S", tz="")
test$g <- g
test1 <- subset(test, g>=as.POSIXct("2007-02-01") & g< as.POSIXct("2007-02-03"))

test1$Global_active_power <- as.numeric(as.character(test1$Global_active_power))
test1$Global_reactive_power <- as.numeric(as.character(test1$Global_reactive_power))
test1$Voltage <- as.numeric(as.character(test1$Voltage))
test1$Sub_metering_1 <- as.numeric(as.character(test1$Sub_metering_1))
test1$Sub_metering_2 <- as.numeric(as.character(test1$Sub_metering_2))
test1$Sub_metering_3 <- as.numeric(as.character(test1$Sub_metering_3))

par(mfrow=c(1,1))
plot(test1$g, test1$Global_active_power, type="l", xlab = "", ylab="Global Active Power(kilowatts)")

dev.copy(png, file="./plot2.png")
dev.off()