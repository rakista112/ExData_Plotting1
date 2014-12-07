electric <- read.delim('household_power_consumption.txt', sep=";", colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

startDate <- as.POSIXct('2007-02-01')
endDate <- as.POSIXct('2007-02-03')

# convert dates and time
electric$DateTime <- strptime(paste(electric$Date, electric$Time), format='%d/%m/%Y %H:%M:%S')
electric <- electric[electric$DateTime >= startDate & electric$DateTime <= endDate , ]

png('plot1.png', width = 480, height = 480)

hist(electric$Global_active_power, 
     col='#FF2500', 
     xlab="Global Active Power (kilowatts)",  
     main='Global Active Power')
  
dev.off()