library(dplyr) 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip")

dataPath <- "exdata_data_household_power_consumption"

full_power_consumption <- read.table(file.path( "household_power_consumption.txt"),sep=";", na.strings="?" ,header = TRUE)

#head(full_power_consumption)
#dim(full_power_consumption)

#filter based on the date 
filtered_power <- full_power_consumption[(full_power_consumption$Date=="1/2/2007" | full_power_consumption$Date=="2/2/2007" ), ]

head(filtered_power)

filtered_power$Date <- as.Date(filtered_power$Date, format="%d/%m/%Y")
dateTime <- paste(filtered_power$Date, filtered_power$Time)
filtered_power$DateTime <- as.POSIXct(dateTime)
head(filtered_power)

par(mfrow=c(2,2), mar=c(5,4,2,1), oma=c(0,0,3,0))
with(filtered_power, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="", cex=0.8)
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="", cex=0.8)
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()