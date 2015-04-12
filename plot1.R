data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")#, nrows=2075259, check.names=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_use <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
hist(data_use$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", width = 480,height = 480)
dev.off()

