test <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
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

png("plot3.png", width = 480, height = 480)

par(mfrow=c(1,1))
lim = range(c(test1$Sub_metering_1, test1$Sub_metering_2,test1$Sub_metering_3))
plot(test1$g, test1$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering",ylim=lim)
par(new = TRUE)
plot(test1$g, test1$Sub_metering_2,type="l", col="red", xlab="", ylab="", ylim=lim)
par(new = TRUE)
plot(test1$g, test1$Sub_metering_3,type="l", col="blue", xlab="", ylab="",ylim=lim)

legend("topright", pch=c(NA, NA,NA),col=c("black", "red", "blue"),legend = c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"),lty=c(1,1,1))

dev.off()