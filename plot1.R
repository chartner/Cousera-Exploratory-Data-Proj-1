file  <- read.csv("~/Desktop/coursera/household_power_consumption.txt", header=TRUE, sep=";")

file$Date <- as.Date(file$Date, format="%d/%m/%Y")
df <- file[(file$Date >="2007-02-01") & (file$Date <="2007-02-02"),]
df[, 3] <- as.numeric(as.character(df[, 3]))

plot1 <- function() {
        hist(df[, 3], main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
}
plot1()