
starttime <- Sys.time()
## read data
hpcData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character", 2), rep("numeric",7)))

## convert date values to date strings
dateStrings <- as.Date(hpcData$Date, format="%d/%m/%Y")

## subset two days
hpcDataTwoDays <- hpcData[dateStrings == "2007-02-01" | dateStrings == "2007-02-02", ]

## make line graph
png(file = "plot2.png")
with(hpcDataTwoDays, plot(strptime(paste(hpcDataTwoDays$Date, hpcDataTwoDays$Time), "%d/%m/%Y %H:%M:%S"), 
                          Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()

## check timing 
endtime <- Sys.time()
endtime - starttime
