powerCon <- fread("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = '?')

powerCon <- powerCon[which(powerCon$Date == '1/2/2007' | powerCon$Date == '2/2/2007'), ]

powerCon[, DateTime := as.POSIXct(paste(powerCon$Date, powerCon$Time), 
                                format="%d/%m/%Y %H:%M:%S")]

png("plot2.png", width = 480, height = 480)

with(powerCon, plot(DateTime, Global_active_power, type = 'l', xlab = '', 
                    ylab = 'Global Active Power (kilowatts)'))

dev.off()