library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_Filter <- filter(NEI,fips == "24510")

NEI_year <- group_by(NEI_Filter, year)
NEI_Total <- summarize(NEI_year, count = n(), Emissions = sum(Emissions, na.rm = T))
barplot(
  (NEI_Total$Emissions),
  names.arg=NEI_Total$year,
  xlab="Year",
  ylab="PM2.5 Emissions (In Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)

dev.copy(png, file="E2plot2.png", height=480, width=480)
dev.off()
