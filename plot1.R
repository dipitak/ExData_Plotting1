
#read household_power_consumption data
#set working directory
wd="path.."
setwd(wd)

#set the file location
dtFile <- "./data/household_power_consumption.txt"

#read the csv file
dtHousehold <- read.csv(dtFile, header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

dtHousehold$Date
#convert Date to Date class providing date format
dtHousehold$Date <- as.Date(dtHousehold$Date, format="%d/%m/%Y")

## Subsetting the data
# get the data in between "2007-02-01" and "2007-02-02"
dtSubHousehold <- subset(dtHousehold, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#remove the dtHousehold as it store in memory and consume memory
# we will be working only in sub set of household i.e dtSubHousehold
rm(dtHousehold)

length(names(dtSubHousehold))

names(dtSubHousehold)

## combine date and time and add new column for datatime combine
dateTime <- paste(as.Date(dtSubHousehold$Date), dtSubHousehold$Time)
dtSubHousehold$Datetime <- as.POSIXct(dateTime)

## Plot 1
# plot histogram  Global Active Power
hist(dtSubHousehold$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()




