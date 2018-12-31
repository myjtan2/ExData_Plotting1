header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE);
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2880);
colnames(data) <- unlist(header);
date_time<-strptime(paste(data$Date, data$Time, sep=" "),'%d/%m/%Y %H:%M:%S');
data<-cbind(date_time,data);
library(reshape2);
melted_data<-melt(data, id.vars = "date_time", measure.vars = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"));
png("plot3.png", width=480, height=480);
with(melted_data, plot(date_time, value,type = "n",ylab="Energy sub metering",xlab="")) 
with(subset(melted_data, variable == "Sub_metering_1"), lines(date_time,value, col = "black")) 
with(subset(melted_data, variable == "Sub_metering_2"), lines(date_time,value, col = "red"))
with(subset(melted_data, variable == "Sub_metering_3"), lines(date_time,value, col = "blue"))
legend ("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"));
dev.off();
