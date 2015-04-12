dfOutcome<-read.table("F://Dropbox/private/working/data science/exploratory data analysis/prj1/household_power_consumption.txt", header=TRUE, sep=";")


dfOutcome$test<-paste(data$Date, data$Time , sep=" ")
dfOutcome$date2<-strptime(data$test, "%d/%m/%Y %H:%M:%S")
dfOutcome$Date<-as.Date(data$Date, format="%d/%m/%Y")
df<-dfOutcome[dfOutcome$Date=='2007-02-01' | dfOutcome$Date=='2007-02-02',]

plot(df$date2, df$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
