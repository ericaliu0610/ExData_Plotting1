data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")#, nrows=2075259, check.names=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_use <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data_use$Date), data_use$Time)
datetime <- as.POSIXct(datetime)
plot(data_use$Global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


