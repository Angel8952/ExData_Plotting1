#Read data 
data <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
data[, DT := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates
data <- data[(DT >= "2007-02-01") & (DT < "2007-02-03")]

png("plot2.png")

## Plot 2
plot(x = data[, DT]
     , y = data[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
