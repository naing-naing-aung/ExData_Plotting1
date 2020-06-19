link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link, "house.zip", method = "curl")

house <- read.csv2(unzip("house.zip"), na.strings = "?")
dat <- subset(house, Date=="1/2/2007" | Date=="2/2/2007")
dat$date_time <- as.POSIXct(paste(dat$Date, dat$Time),
                            format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot_4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#plot 1
plot(dat$date_time, dat$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

#plot 2
plot(dat$date_time, dat$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

#plot 3
plot(dat$date_time, dat$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(dat$date_time, dat$Sub_metering_2, type = "l", col = "red")
lines(dat$date_time, dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"),
       lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
plot(dat$date_time, dat$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
