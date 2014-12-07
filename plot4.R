startDate <- as.POSIXct('2007-02-01')
endDate <- as.POSIXct('2007-02-03')

electric <- read.delim('household_power_consumption.txt', sep=";", colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

# subset data by date
electric$DateTime <- strptime(paste(electric$Date, electric$Time), format='%d/%m/%Y %H:%M:%S')
electric <- electric[electric$DateTime >= startDate & electric$DateTime <= endDate , ]

png('plot4.png', width = 480, height = 480)

par(mfcol=c(2, 2))

# 1st plot
plot(electric$DateTime, electric$Global_active_power, type='l', xlab='', ylab="Global Active Power")

# 2nd plot
plot(electric$DateTime, electric$Sub_metering_1, type='n', ylab='Energy sub metering', xlab='')
lines(electric$DateTime, electric$Sub_metering_1, col='black')
lines(electric$DateTime, electric$Sub_metering_2, col='red')
lines(electric$DateTime, electric$Sub_metering_3, col='blue')
legend('topright', bty='n', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)

# 3rd plot
plot(electric$DateTime, electric$Voltage, type='l', xlab='datetime', ylab='Voltage')

# 4th plot
plot(electric$DateTime, electric$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

dev.off()