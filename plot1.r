header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE);
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2880);
colnames(data) <- unlist(header);

hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power");
dev.copy(png,file="plot1.png");
dev.off();
