link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link, "house.zip", method = "curl")
house <- read.csv2(unzip("house.zip"), na.strings = "?")
dat <- subset(house, Date=="1/2/2007" | Date=="2/2/2007")

hist(as.numeric(dat$Global_active_power), col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.copy(png, "plot_1.png")
dev.off()
