setwd("~/R/hpcdata")
hpcdata <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';', na.strings="?", stringsAsFactors = F)
colnames(hpcdata) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

# 1st plot
plot(1:nrow(hpcdata), hpcdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="", axes=F)
axis(side=1, at=c(0, 1441, 2880), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=seq(0, 10, by=2), labels=seq(0, 10, by=2))
box()

#2nd plot
with(hpcdata, plot(1:nrow(hpcdata), Voltage, type = "l", axes=F, xlab="datetime"))
axis(side=1, at=c(0, 1441, 2880), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=seq(0, 250, by=2), labels=seq(0, 250, by=2))
box()

#3rd plot
with(hpcdata, plot(1:nrow(hpcdata), Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="", axes=F))
with(hpcdata, lines(Sub_metering_2, type = "l", col="red"))
with(hpcdata, lines(Sub_metering_3, type = "l", col="blue"))
axis(side=1, at=c(0, 1441, 2880), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=seq(0, 50, by=10), labels=seq(0, 50, by=10))
box()
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", labels, lwd=c(1,1,1), col = c("black", "red", "blue"), bty="n", cex=0.9)

#4th plot
with(hpcdata, plot(1:nrow(hpcdata), Global_reactive_power, type = "l", axes=F, xlab="datetime"))
axis(side=1, at=c(0, 1441, 2880), labels=c("Thu", "Fri", "Sat"))
axis(side=2, at=seq(0, 1, by=0.1), labels=seq(0, 1, by=0.1))
box()

dev.off()