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
dat <- bind_rows(h1, h2) %>%
        pivot_longer(cols = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"),
                     names_to = "sub_meter", values_to = "sub_values")
ggplot(data = dat, aes(x = as.numeric(Time), y = sub_values,
                       color = sub_meter)) +
        geom_path() +
        scale_x_time(breaks = c("0", "86400", "172800"),
                     labels = c("Thu", "Fri", "Sat")) +
        labs(x = NULL, y = "Energy sub metering") +
        theme(legend.box = "vertical", legend.position = c(1, 1),
              legend.title = element_blank(),
              legend.justification = c(1, 0),
              legend.background = element_rect(color = "black"),
              panel.background = element_rect(color = "black"))
        

dev.copy(png, "plot3.png")
dev.off()
