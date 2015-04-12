dfPower<-read.table("F://Dropbox/private/working/data science/exploratory data analysis/prj1/household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

dfPower$Time <- strptime(paste(dfPower$Date, dfPower$Time), "%d/%m/%Y %H:%M:%S")
dfPower$Date <- as.Date(dfPower$Date, "%d/%m/%Y")

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
dfPower <- subset(dfPower, Date %in% dates)


png("F://Dropbox/private/working/data science/exploratory data analysis/prj1b/plot3.png", width=480, height=480)

plot(dfPower$Time, dfPower$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(dfPower$Time, dfPower$Sub_metering_2, col="red")
lines(dfPower$Time, dfPower$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()