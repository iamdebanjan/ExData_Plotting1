powerCon <- fread("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = '?')

powerCon <- powerCon[which(powerCon$Date == '1/2/2007' | powerCon$Date == '2/2/2007'), ]

powerCon[, DateTime := as.POSIXct(paste(powerCon$Date, powerCon$Time), 
                                  format="%d/%m/%Y %H:%M:%S")]

png("plot3.png", width = 480, height = 480)

plot(powerCon$DateTime, as.numeric(powerCon$Sub_metering_1), xlab = "", 
     ylab = "Energy sub metering", col = 'black', type = 'l')

lines(powerCon$DateTime, as.numeric(powerCon$Sub_metering_2), col = 'red')

lines(powerCon$DateTime, as.numeric(powerCon$Sub_metering_3), col = 'blue')

legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                        col = c('black', 'red', 'blue'))

dev.off()