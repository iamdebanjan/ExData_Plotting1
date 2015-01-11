powerCon <- fread("household_power_consumption.txt", sep = ';', header = TRUE, na.strings = '?')

powerCon <- powerCon[which(powerCon$Date == '1/2/2007' | powerCon$Date == '2/2/2007'), ]

powerCon[, datetime := as.POSIXct(paste(powerCon$Date, powerCon$Time), 
                                  format="%d/%m/%Y %H:%M:%S")]

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

with(powerCon, plot(datetime, as.numeric(Global_active_power), xlab = "", 
     ylab = "Global Active Power", type = "l"))

with(powerCon, plot(datetime, as.numeric(Voltage), 
     ylab = "Voltage", type = "l"))

with(powerCon, plot(datetime, as.numeric(Sub_metering_1), xlab = "", 
     ylab = "Energy sub metering", col = 'black', type = 'l'))

lines(powerCon$datetime, as.numeric(powerCon$Sub_metering_2), col = 'red')

lines(powerCon$datetime, as.numeric(powerCon$Sub_metering_3), col = 'blue')

legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", col = c('black', 'red', 'blue'))

with(powerCon, plot(datetime, as.numeric(Global_reactive_power), 
                    ylab = "Global_reactive_power", type = "l", lwd = 0.01))

dev.off()