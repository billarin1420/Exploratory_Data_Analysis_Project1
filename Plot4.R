## This program is to create the Plot4 of the exploratory Data Analysis Project1
setwd ('C:/Exploratory Project')
library(data.table)
info = read.table('household_power_consumption.txt',header=FALSE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
info=info[-c(1),]
info1 <- info[info$V1 %in% c("1/2/2007","2/2/2007") ,]
global_active_power <- as.numeric(info1$V3)
voltage<- as.numeric(info1$V5)
global_reactive_power<- as.numeric(info1$V4)
sub_metering1 <- as.numeric(info1$V7)
sub_metering2 <- as.numeric(info1$V8)
sub_metering3 <- as.numeric(info1$V9)
date_and_time <- strptime(paste(info1$V1, info1$V2, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(date_and_time, global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(date_and_time, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date_and_time, sub_metering1, type="l", xlab="", ylab="Energy sub metering")
lines(date_and_time, sub_metering2, type="l", col="red")
lines(date_and_time, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"), bty="n")
plot(date_and_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
## End