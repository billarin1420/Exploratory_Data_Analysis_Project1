## This program is to create the Plot2 of the exploratory Data Analysis Project1
setwd ('C:/Exploratory Project')
library(data.table)
info = read.table('household_power_consumption.txt',header=FALSE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
info=info[-c(1),]
info1 <- info[info$V1 %in% c("1/2/2007","2/2/2007") ,]
info2 <- as.numeric(info1$V3)
date_time <- strptime(paste(info1$V1, info1$V2, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(date_time, info2, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
## End