link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link, "house.zip", method = "curl")

house <- read.csv2(unzip("house.zip"), na.strings = "?")
dat <- subset(house, Date=="1/2/2007" | Date=="2/2/2007")
dat$date_time <- as.POSIXct(paste(dat$Date, dat$Time),
                            format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot_2.png", width = 480, height = 480)
plot(dat$date_time, dat$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
