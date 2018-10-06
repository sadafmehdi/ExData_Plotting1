setwd("D:/Data Science/Exploratory Data Analysis/Assignment 1")

##Extracting and selecting the data only for 1/2/2007 and 2/2/2007 for plotting
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
house_a_data <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

##Transform date to Date format and create new variable with Date and Time joined
house_a_data$Date <- as.Date(house_a_data$Date,"%d/%m/%Y")
house_a_data<-cbind(house_a_data, "DateTime" = as.POSIXct(paste(house_a_data$Date, house_a_data$Time)))

png("plot4.png", width=480, height=480)
##Plotting the graph for plot4
par(mfrow=c(2,2))
plot(house_a_data$Global_active_power ~ house_a_data$DateTime, type="l")
plot(house_a_data$Voltage ~ house_a_data$DateTime, type="l")

with(house_a_data, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(house_a_data$Sub_metering_2 ~ house_a_data$DateTime, col = 'Red')
lines(house_a_data$Sub_metering_3 ~ house_a_data$DateTime, col = 'Blue')

plot(house_a_data$Global_reactive_power ~ house_a_data$DateTime, type="l")

dev.off()
