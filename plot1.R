electric <- read.delim('household_power_consumption.txt', sep=";", colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

# convert dates and time
electric$Date <- as.Date(electric$Date, '%d/%m/%Y')
electric$Time <- strptime(electric$Time, '%H:%M:%S')
electric <- electric[electric$Date >= as.Date('2007-02-01') & electric$Date <= as.Date('2007-02-02'), ]

png('plot1.png', width = 480, height = 480)

hist(electric$Global_active_power, 
     col='orangered2', 
     xlab="Global Active Power (kilowatts)",  
     main='Global Active Power')

dev.off()