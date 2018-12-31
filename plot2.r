header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE);
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2880);
colnames(data) <- unlist(header);
date_time<-strptime(paste(data$Date, data$Time, sep=" "),'%d/%m/%Y %H:%M:%S');
data<-cbind(date_time,data);
plot(data$date_time,data$Global_active_power,type="l",ylab="Global Active Power",xlab="");
dev.copy(png,file="plot2.png");
dev.off();
