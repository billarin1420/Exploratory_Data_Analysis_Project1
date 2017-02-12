## This program is to create the Plot2 of the exploratory Data Analysis Project1
## First part of the program aims to read the .txt file and subset the data based on the target dates for the analisys
setwd ('C:/Exploratory Project')
library(data.table)
info = read.table('household_power_consumption.txt',header=FALSE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
info=info[-c(1),]
info1 <- info[info$V1 %in% c("1/2/2007","2/2/2007") ,]
## set the data for the plot in numeric format and adjust the time and date format
global_active_power <- as.numeric(info1$V3)
date_time <- strptime(paste(info1$V1, info1$V2, sep=" "), "%d/%m/%Y %H:%M:%S")
## Set the plot
png("plot2.png", width=480, height=480)
plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
## End