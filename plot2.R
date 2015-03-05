##set the working directory
setwd("C:/Users/Administrator/Desktop/MLDM/Coursera/JHU data science/exploratory data");

##read data to R
EPC <- read.table("household_power_consumption.txt",header=TRUE,sep=";");

##change the Date to standard scheme
EPC[,1] <- as.Date(EPC[,1],"%d/%m/%Y");

##calculate the number of Date 2007-02-01 and 2007-02-02
Ind1 <- EPC[,1]==as.Date(c("01/02/2007"),"%d/%m/%Y")
sum_Ind1 <- sum(Ind1)
Ind2 <- EPC[,1]==as.Date(c("02/02/2007"),"%d/%m/%Y")
sum_Ind2 <- sum(Ind2)

##select subset of raw data
Index <- EPC[,1]==as.Date(c("01/02/2007"),"%d/%m/%Y") | EPC[,1]==as.Date(c("02/02/2007"),"%d/%m/%Y");
sub_EPC <- EPC[Index,];

##change the class of data, raw data is factor
data1 <- as.numeric(levels(sub_EPC$Global_active_power))[sub_EPC$Global_active_power]

##plot
x <- c(1:(sum_Ind1+sum_Ind2))
plot(x,data1,type="l",ylab="Global Active Power(kilowatts)",xaxt="n",xlab="");
axis(1,at=c(0,sum_Ind1,sum_Ind1+sum_Ind2),labels=c("Thu","Fri","Sta"));

##generate PNG image
dev.copy(png,file="plot2.png")
dev.off()