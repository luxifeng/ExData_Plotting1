## Read text file
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, skip = 66636, nrows = 2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
## Change time local to avoid non-English characters
Sys.setlocale("LC_TIME", "English")
## Close the current graphical device and open new device
dev.off(dev.list()["RStudioGD"])
dev.new(width = 480, height = 480)
par(mfrow = c(1, 1))
## Plot
with(data, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(Datetime, Sub_metering_2, col = "red"))
with(data, lines(Datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)
## Save
dev.copy(png, "plot3.png")
dev.off()