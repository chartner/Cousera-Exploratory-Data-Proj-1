file  <- read.csv("~/Desktop/coursera/household_power_consumption.txt", header=TRUE, sep=";")

file$Date <- as.Date(file$Date, format="%d/%m/%Y")
subf <- file[(file$Date >="2007-02-01") & (file$Date <="2007-02-02"),]
subf[, 3] <- as.numeric(as.character(subf[, 3]))
subf <- transform(subf, time=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot2 <- function() {
        plot(subf$time, subf[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
}
plot2()