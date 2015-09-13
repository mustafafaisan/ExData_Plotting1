library(sqldf)    
fileName = "household_power_consumption.txt"
file = file.path(".", fileName )

tab5Rows = read.table(file, nrows =  5, header = TRUE, sep = ";")
classes = sapply(tab5Rows, class)

sqlquery = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
subData = read.csv.sql(file, sql = sqlquery, header = TRUE, sep = ";"
                       ,colClasses = classes)
subData = na.omit(subData)
readingDate <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#globalActivePower <- as.numeric(subSetData$Global_active_power)
png(file.path(".", "plot2.png" ))
plot(readingDate, subData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
