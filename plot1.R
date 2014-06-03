
starttime <- Sys.time()
## read data
hpcData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character", 2), rep("numeric",7)))

## convert date values to date strings
dateStrings <- as.Date(hpcData$Date, format="%d/%m/%Y")

## subset two days
hpcDataTwoDays <- hpcData[dateStrings == "2007-02-01" | dateStrings == "2007-02-02", ]

## make histogram
hist(hpcDataTwoDays$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")
dev.off()

## check timing 
endtime <- Sys.time()
endtime - starttime
