starttime <- Sys.time()
## read data
hpcData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character", 2), rep("numeric",7)))

## convert date values to date strings
dateStrings <- as.Date(hpcData$Date, format="%d/%m/%Y")

## subset two days
hpcDataTwoDays <- hpcData[dateStrings == "2007-02-01" | dateStrings == "2007-02-02", ]

## make line graph
png(file = "plot4.png")

par(mfcol = c(2, 2))

with(hpcDataTwoDays, plot(strptime(paste(hpcDataTwoDays$Date, hpcDataTwoDays$Time), "%d/%m/%Y %H:%M:%S"), 
                          Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

with(hpcDataTwoDays, 
     plot(strptime(paste(hpcDataTwoDays$Date, hpcDataTwoDays$Time), "%d/%m/%Y %H:%M:%S"), 
          Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
)

lines(strptime(paste(hpcDataTwoDays$Date, hpcDataTwoDays$Time), "%d/%m/%Y %H:%M:%S"), 
      hpcDataTwoDays$Sub_metering_2, col="red")

lines(strptime(paste(hpcDataTwoDays$Date, hpcDataTwoDays$Time), "%d/%m/%Y %H:%M:%S"), 
      hpcDataTwoDays$Sub_metering_3, col="blue")

legend("topright", lty=1, lwd=2, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n"
)

with(hpcDataTwoDays, plot(strptime(paste(hpcDataTwoDays$Date, hpcDataTwoDays$Time), "%d/%m/%Y %H:%M:%S"), 
                          Voltage, type="l", xlab="datetime"))

with(hpcDataTwoDays, plot(strptime(paste(hpcDataTwoDays$Date, hpcDataTwoDays$Time), "%d/%m/%Y %H:%M:%S"), 
                          Global_reactive_power, type="l", xlab="datetime"))



dev.off()

## check timing 
endtime <- Sys.time()
endtime - starttime