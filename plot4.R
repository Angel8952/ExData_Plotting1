#Read data 
data <- data.table::fread(input = "household_power_consumption.txt"
                          , na.strings="?"
)
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
data[, DT := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates
data <- data[(DT >= "2007-02-01") & (DT < "2007-02-03")]

#Plot 4
png("plot4.png")
par(mfrow=c(2,2))

plot(data[, DT], data[, Global_active_power], type="l", xlab="", ylab="Global Active Power")


plot(data[, DT],data[, Voltage], type="l", xlab="DT", ylab="Voltage")


plot(data[, DT], data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(data[, DT], data[, Sub_metering_2], col="red")
lines(data[, DT], data[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 


plot(data[, DT], data[,Global_reactive_power], type="l", xlab="DT", ylab="Global_reactive_power")

dev.off()
