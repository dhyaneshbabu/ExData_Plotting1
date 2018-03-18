library(dplyr) 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip")

dataPath <- "exdata_data_household_power_consumption"

full_power_consumption <- read.table(file.path( "household_power_consumption.txt"),sep=";", na.strings="?" ,header = TRUE)

#head(full_power_consumption)
#dim(full_power_consumption)

#filter based on the date 
filtered_full_power_consumption <- full_power_consumption[(full_power_consumption$Date=="1/2/2007" | full_power_consumption$Date=="2/2/2007" ), ]

#head(filtered_full_power_consumption)
#dim(filtered_full_power_consumption)

hist(filtered_full_power_consumption$Global_active_power,col="red",main="Global active power",xlab ="Global active power (Kilowatt)" ,cex.sub=0.8)

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()