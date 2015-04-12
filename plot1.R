library(data.table)
library(chron)

dtTemp <- fread("F://Dropbox/private/working/data science/exploratory data analysis/prj1/household_power_consumption.txt", header=TRUE, na.strings=c("NA", "?",""), colClasses=c("character", "date", "character", "character", "character", "numberic", "character", "numberic", "numeric"))
dtTemp[dtTemp=="?"] <- NA
dtTemp2 <- dtTemp[, Global_active_power:=as.numeric(Global_active_power)]
dtOutcome <- dtTemp2[Date=="1/2/2007"|Date=="2/2/2007"]
dtOutcome[,datestamp:=as.Date(Date, format="%d/%m/%Y")]
dtOutcome[,timestamp:=as.ITime(Time, format="%H:%M:%S")]

View(dtOutcome)


sapply(dtOutcome, class)

png("F://Dropbox/private/working/data science/exploratory data analysis/prj1/plot1.png", width=480, height=480)
hist(dtOutcome$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

