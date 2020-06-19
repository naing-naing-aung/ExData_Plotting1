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


dev.off()
