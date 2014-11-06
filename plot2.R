## Read text file
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, skip = 66636, nrows = 2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
## Change time local to avoid non-English characters
Sys.setlocale("LC_TIME", "English")
## Convert the Date and Time variables to Date/Time classes
datetime <- paste(data$Date, data$Time)
Datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
data <- cbind(data, Datetime)
## Close the current graphical device and open nre device
dev.off(dev.list()["RStudioGD"])
dev.new(width = 480, height = 480)
par(mfrow = c(1, 1))
## Plot
with(data, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
## Save
dev.copy(png, "plot2.png")
dev.off()