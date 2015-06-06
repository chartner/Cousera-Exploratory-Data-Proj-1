file  <- read.csv("~/Desktop/coursera/household_power_consumption.txt", header=TRUE, sep=";")

file$Date <- as.Date(file$Date, format="%d/%m/%Y")  ##format date
subf <- file[(file$Date >="2007-02-01") & (file$Date <="2007-02-02"),]  ##get a subset of the data required
subf[, 3] <- as.numeric(as.character(subf[, 3])) ##convert entries to numeric
subf[, 4] <- as.numeric(as.character(subf[, 4]))
subf[, 5] <- as.numeric(as.character(subf[, 5]))
subf[, 7] <- as.numeric(as.character(subf[, 7]))
subf[, 8] <- as.numeric(as.character(subf[, 8]))
subf[, 9] <- as.numeric(as.character(subf[, 9]))
subf <- transform(subf, time=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") ##format time

plot4 <- function() {
        par(mfrow=c(2,2)) ##create plot matrix
        par(mar=c(4,4,1,1)) ## corrects for error "margins too large" when displaying plots
        
        plot(subf$time, subf[, 3], type="l", xlab="", ylab="Global Active Power") ##plot1
        
        
        plot(subf$time, subf[, 5], type="l", xlab="datetime", ylab="Voltage") ##plot3
        
        
        plot(subf$time, subf[,7], type="l", xlab="", ylab="Energy sub metering") ##plot2
        lines(subf$time, subf[, 8], col="red")
        lines(subf$time, subf[, 9], col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty=1, bty="n") ##bty removes legend box
        
        
        plot(subf$time, subf[, 4], type="l", xlab="datetime", ylab="Global_Reactive_Power") ##plot4
        
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
}
        
plot4()



