file  <- read.csv("~/Desktop/coursera/household_power_consumption.txt", header=TRUE, sep=";")

file$Date <- as.Date(file$Date, format="%d/%m/%Y")
subf <- file[(file$Date >="2007-02-01") & (file$Date <="2007-02-02"),]
subf[, 3] <- as.numeric(as.character(subf[, 3]))
subf[, 7] <- as.numeric(as.character(subf[, 7]))
subf[, 8] <- as.numeric(as.character(subf[, 8]))
subf[, 9] <- as.numeric(as.character(subf[, 9]))
subf <- transform(subf, time=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot3 <- function() {
        plot(subf$time, subf[,7], type="l", xlab="", ylab="Energy sub metering")
        lines(subf$time, subf[, 8], col="red")
        lines(subf$time, subf[, 9], col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty=1, lwd=1)
        par(mar=c(4,4,1,1))
        
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
}
plot3()