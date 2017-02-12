## This program is to create the Plot3 of the exploratory Data Analysis Project1
## First part of the program aims to read the .txt file and subset the data based on the target dates for the analisys
setwd ('C:/Exploratory Project')
library(data.table)
info = read.table('household_power_consumption.txt',header=FALSE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
info=info[-c(1),]
info1 <- info[info$V1 %in% c("1/2/2007","2/2/2007") ,]
## set the data for the plot in numeric format and adjust the time and date format
sub_metering1 <- as.numeric(info1$V7)
sub_metering2 <- as.numeric(info1$V8)
sub_metering3 <- as.numeric(info1$V9)
date_and_time <- strptime(paste(info1$V1, info1$V2, sep=" "), "%d/%m/%Y %H:%M:%S")
## Set the plot
png("plot3.png", width=480, height=480)
plot(date_and_time, sub_metering1, type="l", xlab="", ylab="Energy sub metering")
lines(date_and_time, sub_metering2, type="l", col="red")
lines(date_and_time, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
## End