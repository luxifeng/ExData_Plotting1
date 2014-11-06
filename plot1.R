## Read text file
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, skip = 66636, nrows = 2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
## Get column
globalActivePower.raw <- data[, 3]
## Clean data
globalActivePower.tidy <- globalActivePower.raw[!is.na(globalActivePower.raw)]
## Close the current graphical device and open nre device
dev.off(dev.list()["RStudioGD"])
dev.new(width = 480, height = 480)
par(mfrow = c(1, 1))
## Plot
hist(globalActivePower.tidy, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## Save PNG
dev.copy(png, file = "plot1.png")
dev.off()