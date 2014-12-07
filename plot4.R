## Read text file
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, skip = 66636, nrows = 2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
## Change time local to avoid non-English characters
Sys.setlocale("LC_TIME", "English")
## Convert the Date and Time variables to Date/Time classes
datetime <- paste(data$Date, data$Time)
Datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
data <- cbind(data, Datetime)
## Close the current graphical device and open new device
dev.off(dev.list()["RStudioGD"])
dev.new(width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
## Plot
with(data,{
        ## figure topleft
        with(data, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
        ## figure topright
        with(data, plot(Datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
        ## figure bottomleft
        with(data, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
        with(data, lines(Datetime, Sub_metering_2, col = "red"))
        with(data, lines(Datetime, Sub_metering_3, col = "blue"))
        legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.7)
        ## figure bottomright
        with(data, plot(Datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
})
## Save
dev.copy(png, "plot4.png")
dev.off()