## Reading Household Power Consumption text files using read.table() in R
householdData <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

## Subset Dataframe to read data for Dates 01/02/2007 & 02/02/2007
householdData.df <- householdData[which(householdData$Date %in% c('1/2/2007', '2/2/2007')),]

## Defining a new variable "datetime" by combining variables "date" and "time"
## Setting format of "datetime" using strptime() function as to perform manipulation operations
householdData.df$datetime <- paste(householdData.df$Date, householdData.df$Time, sep=" ")
householdData.df$datetime <- strptime(householdData.df$datetime, "%d/%m/%Y %H:%M:%S")

## Copy outout to PNG File of resolution 480 x 480 pixels
png(
    filename = "plot4.png"
    , width = 480
    , height = 480
    , units = 'px'
)

## Define output layout
par(mfrow = c(2,2))

## Plot1: Golbal Activer Power Vs. Datetime
plot(householdData.df$datetime, as.numeric(as.character(householdData.df$Global_active_power)), type='l', xlab="", ylab="Global Active Power (kilowatts)")

## Plot2: Voltage Vs. Datetime
plot(householdData.df$datetime, as.numeric(as.character(householdData.df$Voltage)), type='l', xlab="datetime", ylab="Voltage")

## Plot3: Submetering Vs. Datetime
plot(householdData.df$datetime, as.numeric(as.character(householdData.df$Sub_metering_1)), type='l', xlab="", ylab="Energy sub metering", col='black')
lines(householdData.df$datetime, as.numeric(as.character(householdData.df$Sub_metering_2)), col='red')
lines(householdData.df$datetime, as.numeric(as.character(householdData.df$Sub_metering_3)), col='blue')
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

## Plot4: Reactive Power Vs. Datetime
plot(householdData.df$datetime, as.numeric(as.character(householdData.df$Global_reactive_power)), type='l', xlab="datetime", ylab="Global_reactive_power")

dev.off()
