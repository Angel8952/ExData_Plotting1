#Read data 
data <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)
data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Filter dates
data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Plot1
png("plot1.png")
hist(data$Global_active_power, main="Global Active Power", xlab="Global active power (kilowatts)", ylab = "Frequency", col = "Red")
dev.off()
