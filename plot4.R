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

##generate sub figures(2*2)
par(mfrow=c(2,2),mar=c(3,4,3,4))

####################################################################################
##up left figure
##calculate the number of Date 2007-02-01 and 2007-02-02
Ind1 <- EPC[,1]==as.Date(c("01/02/2007"),"%d/%m/%Y")
sum_Ind1 <- sum(Ind1)
Ind2 <- EPC[,1]==as.Date(c("02/02/2007"),"%d/%m/%Y")
sum_Ind2 <- sum(Ind2)
##change the class of data, raw data is factor
data1 <- as.numeric(levels(sub_EPC$Global_active_power))[sub_EPC$Global_active_power]
##plot
x <- c(1:(sum_Ind1+sum_Ind2))
plot(x,data1,type="l",ylab="Global Active Power(kilowatts)",xaxt="n",xlab="");
axis(1,at=c(0,sum_Ind1,sum_Ind1+sum_Ind2),labels=c("Thu","Fri","Sta"));

####################################################################################
##up right figure
##change the class of data, raw data is factor
data1 <- as.numeric(levels(sub_EPC$Voltage))[sub_EPC$Voltage]
plot(x,data1,type="l",ylab="Voltage",xlab="datetime",xaxt="n");
axis(1,at=c(0,sum_Ind1,sum_Ind1+sum_Ind2),labels=c("Thu","Fri","Sta"));

####################################################################################
##bottom left
##change the class of data, raw data is factor
data1 <- as.numeric(levels(sub_EPC$Sub_metering_1))[sub_EPC$Sub_metering_1]
data2 <- as.numeric(levels(sub_EPC$Sub_metering_2))[sub_EPC$Sub_metering_2]
data3 <- sub_EPC$Sub_metering_3
##plot
x <- c(1:(sum_Ind1+sum_Ind2))
plot(x,data1,type="l",xaxt="n",xlab="",col="black",ylab="Energy Sub Metering");
points(x,data2,type="l",col="red")
points(x,data3,type="l",col="blue")
axis(1,at=c(0,sum_Ind1,sum_Ind1+sum_Ind2),labels=c("Thu","Fri","Sta"));
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#####################################################################################
##bottom right figure
data1 <- as.numeric(levels(sub_EPC$Global_reactive_power))[sub_EPC$Global_reactive_power]
plot(x,data1,type="l",ylab="Global Reactive Power",xaxt="n",xlab="datetime");
axis(1,at=c(0,sum_Ind1,sum_Ind1+sum_Ind2),labels=c("Thu","Fri","Sta"));

######################################################################################
##generate PNG image
dev.copy(png,file="plot4.png")
dev.off()