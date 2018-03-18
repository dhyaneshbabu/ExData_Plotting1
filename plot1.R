
library(dplyr) 
dataPath <- "exdata_data_household_power_consumption"
training_Subjects <- read.table(file.path(dataPath, "household_power_consumption.txt"),sep=";",header = TRUE)
head(training_Subjects)

training_Subjects$Date <- as.Date( as.character(training_Subjects$Date), "%d-%m-%y")

filtered_DF <- filter(training_Subjects, Date ==as.Date("01/02/2007")  )
head(filtered_DF)