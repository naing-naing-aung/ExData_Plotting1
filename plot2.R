library(tidyverse)
link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link, "house.zip", method = "curl")
house <- read.csv2(unzip("house.zip"), na.strings = "?")
house1 <- house %>%
        mutate(Date = dmy(Date), Time = hms(Time)) %>%
        filter(Date=="2007-02-01" | Date=="2007-02-02") %>%
        mutate_if(is.character, as.numeric)
h1 <- house1 %>%
        filter(Date=="2007-02-01")
h2 <- house1 %>%
        filter(Date=="2007-02-02") %>%
        mutate(Time = Time + hours(24))
dat <- bind_rows(h1, h2)
ggplot(data = dat, mapping = aes(as.numeric(Time), Global_active_power)) +
        geom_path() +
        scale_x_time(breaks = c("0", "86400", "172800"),
                     labels = c("Thu", "Fri", "Sat")) +
        labs(x = "", y = "Global Active Power (kilowatts)") +
        theme(panel.background = element_rect(color = "black"))


dev.copy(png, "plot2.png")
dev.off()
