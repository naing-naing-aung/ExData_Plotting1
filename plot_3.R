link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link, "house.zip", method = "curl")

house <- read.csv2(unzip("house.zip"), na.strings = "?")
dat <- subset(house, Date=="1/2/2007" | Date=="2/2/2007")
dat$date_time <- as.POSIXct(paste(dat$Date, dat$Time),
                            format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot_3.png", width = 480, height = 480)
plot(dat$date_time, dat$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(dat$date_time, dat$Sub_metering_2, type = "l", col = "red")
lines(dat$date_time, dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"),
       lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
