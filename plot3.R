startDate <- as.POSIXct('2007-02-01')
endDate <- as.POSIXct('2007-02-03')

electric <- read.delim('household_power_consumption.txt', sep=";", colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

# subset data by date
electric$DateTime <- strptime(paste(electric$Date, electric$Time), format='%d/%m/%Y %H:%M:%S')
electric <- electric[electric$DateTime >= startDate & electric$DateTime <= endDate , ]

png('plot3.png', width = 480, height = 480)

plot(electric$DateTime, electric$Sub_metering_1, type='n', ylab='Energy sub metering', xlab='')
lines(electric$DateTime, electric$Sub_metering_1, col='black')
lines(electric$DateTime, electric$Sub_metering_2, col='red')
lines(electric$DateTime, electric$Sub_metering_3, col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
dev.off()