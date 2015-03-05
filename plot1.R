##set the working directory
setwd("C:/Users/Administrator/Desktop/MLDM/Coursera/JHU data science/exploratory data");

##read data to R
EPC <- read.table("household_power_consumption.txt",header=TRUE,sep=";");

##change the Date to standard scheme
EPC[,1] <- as.Date(EPC[,1],"%d/%m/%Y");

##select subset of raw data
Index <- EPC[,1]==as.Date(c("01/02/2007"),"%d/%m/%Y") | EPC[,1]==as.Date(c("02/02/2007"),"%d/%m/%Y");
sub_EPC <- EPC[Index,];

##change the class of data, raw data is factor
data1 <- as.numeric(levels(sub_EPC$Global_active_power))[sub_EPC$Global_active_power]

##plot
hist(data1,xlab="Global Active Power(kilowatts)",main=paste("Global Active Power"),col="red")

##generate PNG image
dev.copy(png,file="plot1.png")
dev.off()