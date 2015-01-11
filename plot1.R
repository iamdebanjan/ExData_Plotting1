powerCon <- fread("household_power_consumption.txt", sep = ';', header = TRUE)

powerCon <- powerCon[which(powerCon$Date == '1/2/2007' | powerCon$Date == '2/2/2007'), ]

powerCon[, "Date"] <- as.Date(strptime(powerCon[, "Date"], format='%d/%m/%Y'))

png("plot1.png", width = 480, height = 480)

hist(as.numeric(powerCon$Global_active_power), col = "Red", xlab = "Global Active Power",
     main = "Global Active Power")

dev.off()