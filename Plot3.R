setwd("D:/Data Science/Exploratory Data Analysis/Assignment 1")

##Extracting and selecting the data only for 1/2/2007 and 2/2/2007 for plotting
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
house_a_data <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])
##Transform date to Date format and create new variable with Date and Time joined
house_a_data$Date <- as.Date(house_a_data$Date,"%d/%m/%Y")
house_a_data<-cbind(house_a_data, "DateTime" = as.POSIXct(paste(house_a_data$Date, house_a_data$Time)))

png("plot3.png", width=480, height=480)

##Plotting the graph for plot3
with(house_a_data, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})

lines(house_a_data$Sub_metering_2 ~ house_a_data$DateTime, col = 'Red')
lines(house_a_data$Sub_metering_3 ~ house_a_data$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
