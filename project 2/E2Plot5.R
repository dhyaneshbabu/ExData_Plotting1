library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]

baltimore_VehiclesNEI <- vehicles_NEI[vehicles_NEI$fips==24510,]


# View(baltimore_VehiclesNEI)
# dim(baltimore_VehiclesNEI)
# dim(NEI)

g<- ggplot(baltimore_VehiclesNEI,aes(factor(year),Emissions/(10^2)))
my_plot <- g+geom_bar(stat = "identity")+ labs(y="Emissions from coal combustion-related sources (10^2)",x="Year (1999 - 2008)")
print(my_plot)

ggsave("E2plot5.png", plot = my_plot) 


