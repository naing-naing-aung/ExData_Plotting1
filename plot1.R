library(tidyverse)
link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link, "house.zip", method = "curl")
house <- read.csv2(unzip("house.zip"), na.strings = "?")
house1 <- house %>%
        mutate(Date = dmy(Date), Time = hms(Time)) %>%
        filter(Date=="2007-02-01" | Date=="2007-02-02") %>%
        mutate_if(is.character, as.numeric)
ggplot(data = house1) +
        geom_histogram(aes(Global_active_power), fill = "red", color = "black") +
        labs(x = "Global Active Power (kilowatts)",
             y = "Frequency",
             title = "Global Active Power") +
        theme(plot.title = element_text(hjust = 0.5))
dev.copy(png, "plot1.png")
dev.off()
