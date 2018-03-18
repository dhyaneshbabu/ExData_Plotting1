library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]

place <-c("24510","06037")

baltimore_VehiclesNEI_both_city <- subset(vehicles_NEI, vehicles_NEI$fips %in% place)


# View(baltimore_VehiclesNEI)
# dim(baltimore_VehiclesNEI)
# dim(NEI)

g<- ggplot(baltimore_VehiclesNEI_both_city,aes((year),Emissions,color=fips))
my_plot <- g+geom_line(stat = "summary",fun.y ="sum")+ labs(y="Emissions from coal combustion-related sources (10^2)",x="Year (1999 - 2008)")+scale_colour_discrete(name = "City", label = c("Los Angeles","Baltimore"))

print(my_plot)

ggsave("E2plot6.png", plot = my_plot) 