#Read the subset data(data for Dates as specified in the question) into a data frame 
data <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrow=2880)
#Set the column names 
names(data) <- strsplit(readLines("household_power_consumption.txt" ,n=1),";")[[1]]
#Change the data format 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Open the PNG device 
png(file="plot4.png",width=480,height=480)
#Plot the plot 
par(mfrow=c(2,2))
#Plot1
plot(data$Global_active_power,type="l",axes=FALSE,ylab="Global Active Power",xlab="")
axis(side=1,at=c(0,nrow(data)/2,nrow(data)),label=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,2,4,6))
box(which="plot")
#Plot2
plot(data$Voltage,type="l",axes=FALSE,ylab="Voltage",xlab="datetime")
axis(side=1,at=c(0,nrow(data)/2,nrow(data)),label=c("Thu","Fri","Sat"))
axis(side=2,at=c(234,238,242,246))
box(which="plot")
#Plot3
plot(data$Sub_metering_1,type="l",axes=FALSE,ylab="Energy sub metering",xlab="",)
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue")
axis(side=1,at=c(0,nrow(data)/2,nrow(data)),label=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,10,20,30))
box(which="plot")
legend("topright",bty="n",cex=0.6,lty=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot4
plot(data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",axes=FALSE)
axis(side=1,at=c(0,nrow(data)/2,nrow(data)),label=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,0.1,0.2,0.3,0.4,0.5))
box(which="plot")
#Close the PNG device so that a png file of histogram is formed 
dev.off()
