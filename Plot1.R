setwd("D:/Data Science/Exploratory Data Analysis/Assignment 1")

##Extracting and selecting the data only for 1/2/2007 and 2/2/2007 for plotting
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
house_a_data <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])
##Transform date to Date format and create new variable with Date and Time joined
house_a_data$Date <- as.Date(house_a_data$Date,"%d/%m/%Y")
house_a_data<-cbind(house_a_data, "DateTime" = as.POSIXct(paste(house_a_data$Date, house_a_data$Time)))

png("plot1.png", width=480, height=480)

##Plotting the graph for plot1
hist(as.numeric(house_a_data$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")

dev.off()


