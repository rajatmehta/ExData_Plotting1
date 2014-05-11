## Reading Household Power Consumption text files using read.table() in R
householdData <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

## Subset Dataframe to read data for Dates 01/02/2007 & 02/02/2007
householdData.df <- householdData[which(householdData$Date %in% c('1/2/2007', '2/2/2007')),]

## Copy outout to PNG File of resolution 480 x 480 pixels
png(
    filename = "plot1.png"
    , width = 480
    , height = 480
    , units = 'px'
    )

## Draws Histogram Plot of Global Active Power. Also, the statement(s) below 
## perform the following tasks: 
##
## a. Convert Global Active Power variable from Factor to Numeric
## b. Define Main & X Axis Labels
## c. Assign Color of Histogram to Red
## d. Defines number of Breaks = 12

hist(as.numeric(as.character(householdData.df$Global_active_power)), breaks=12, 
     col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()