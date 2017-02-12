## This program is for the create the Plot1 of the exploratory Data Analysis Project1
setwd ('C:/Exploratory Project')
library(data.table)
info = read.table('household_power_consumption.txt',header=FALSE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
info=info[-c(1),]
info1 <- info[info$V1 %in% c("1/2/2007","2/2/2007") ,]
info2 <- as.numeric(info1$V3)
png("plot1.png", width=480, height=480)
hist(info2, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
## End