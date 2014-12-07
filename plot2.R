startDate <- as.POSIXct('2007-02-01')
endDate <- as.POSIXct('2007-02-03')

electric <- read.delim('household_power_consumption.txt', sep=";", colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')


electric$DateTime <- strptime(paste(electric$Date, electric$Time), format='%d/%m/%Y %H:%M:%S')
electric <- electric[electric$DateTime >= startDate & electric$DateTime <= endDate , ]
electric$Weekday <-  strftime(electric$DateTime, format='%a')
electric$Weekday <- as.factor(electric$Weekday)

#electric
plot(electric$DateTime, electric$Global_active_power, type='l', xaxt='n', xlab='', ylab="Global Active Power (kilowatts)")
axis.POSIXct(1, at = seq(startDate, endDate + 1, 'day'), format = "%a")
