#Set the working directory and then load the data
setwd("C:/Users/I321508/Desktop/R Practice/C4W1")
data <- read.csv2("household_power_consumption.txt")

#Subset the data as per requirement
subset_data <- subset(data, subset = (Date=="1/2/2007" | Date =="2/2/2007"))
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Convert class of global active power from factor to numeric
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

#Start a png device and plot the graph there. Close the device after plot
png("plot2.png", width= 480, height = 480, units = "px")
with(subset_data, plot(datetime, (Global_active_power)/500, type = "l",xlab = "", ylab = "Global Active Power(kilowatts)"))
dev.off()