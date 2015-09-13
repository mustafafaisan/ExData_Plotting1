
# This function assumes that data file is in current directory

library(sqldf)    
fileName = "household_power_consumption.txt"
file = file.path(".", fileName )

tab5Rows = read.table(file, nrows =  5, header = TRUE, sep = ";")
classes = sapply(tab5Rows, class)
classes
# 2007-02-01 and 2007-02-02
sqlquery = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
subData = read.csv.sql(file, sql = sqlquery, header = TRUE, sep = ";"
                       ,colClasses = classes)
subData = na.omit(subData)
png(file.path(".", "plot1.png" ))
hist(subData$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowats)", main="Global Active Power")
dev.off()
