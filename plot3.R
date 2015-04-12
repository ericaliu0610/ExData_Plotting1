data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")#, nrows=2075259, check.names=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_use <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data_use$Date), data_use$Time)
datetime <- as.POSIXct(datetime)
with(data_use, {plot(Sub_metering_1~datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
            lines(Sub_metering_2~datetime,col='Red')
             lines(Sub_metering_3~datetime,col='Blue')})
legend_text = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=legend_text,pch=1, cex=1.0)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

