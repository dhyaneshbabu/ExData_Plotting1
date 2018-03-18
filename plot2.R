library(dplyr) 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip")

dataPath <- "exdata_data_household_power_consumption"

full_power_consumption <- read.table(file.path( "household_power_consumption.txt"),sep=";", na.strings="?" ,header = TRUE)

#head(full_power_consumption)
#dim(full_power_consumption)

#filter based on the date 
filtered_power <- full_power_consumption[(full_power_consumption$Date=="1/2/2007" | full_power_consumption$Date=="2/2/2007" ), ]

#head(filtered_power)
#dim(filtered_power)

#format date and time
filtered_power$Date <- as.Date(filtered_power$Date, format="%d/%m/%Y")
dateTime <- paste(filtered_power$Date, filtered_power$Time)
filtered_power$DateTime <- as.POSIXct(dateTime)
head(filtered_power)

plot(filtered_power$DateTime, filtered_power$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()