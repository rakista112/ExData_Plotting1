startDate <- as.POSIXct('2007-02-01')
endDate <- as.POSIXct('2007-02-03')

electric <- read.delim('household_power_consumption.txt', sep=";", colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

# subset data by date
electric$DateTime <- strptime(paste(electric$Date, electric$Time), format='%d/%m/%Y %H:%M:%S')
electric <- electric[electric$DateTime >= startDate & electric$DateTime <= endDate , ]

png('plot2.png', width = 480, height = 480)

plot(electric$DateTime, electric$Global_active_power, type='l', xlab='', ylab="Global Active Power (kilowatts)")

# save image
dev.off()