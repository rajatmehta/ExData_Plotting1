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
    filename = "plot2.png"
    , width = 480
    , height = 480
    , units = 'px'
)
## Create Plot of "Global Active Power" and "datetime" variables. Also, the statement(s) 
##    below perform the following tasks: 
##
## a. Convert Global Active Power variable from Factor to Numeric
## b. Define Y Axis Labels

plot(householdData.df$datetime, as.numeric(as.character(householdData.df$Global_active_power)), type='l', xlab="", ylab="Global Active Power (kilowatts)")

dev.off()