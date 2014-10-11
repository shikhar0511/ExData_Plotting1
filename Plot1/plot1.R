#Read the subset data(data for Dates as specified in the question) into a data frame 
data <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrow=2880)
#Set the column names 
names(data) <- strsplit(readLines("household_power_consumption.txt" ,n=1),";")[[1]]
#Change the data format 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Open the PNG device 
    png(file="plot1.png",width=480,height=480)
#Plot the histogram required 
hist(data$Global_active_power,xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")
#Close the PNG device so that a png file of histogram is formed 
dev.off()
