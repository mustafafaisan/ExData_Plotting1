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
png(file.path(".", "plot3.png" ))
plot(x = as.data.frame(readingDate), y = subSetData$Sub_metering_1,
     type = "n", xlab = "", ylab = "Energy sub metering")
lines(x = readingDate, y = subData$Sub_metering_1, col = "green")
lines(x = readingDate, y = subData$Sub_metering_2, col = "red")
lines(x = readingDate, y = subData$Sub_metering_3, col = "blue")
legend("topright", c("sub_metering_1","sub_metering_2", "sub_metering_3"), lty=c(1,1), col=c("green", "blue","red"))


dev.off()
