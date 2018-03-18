library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_scc <- SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]
NEI_coal<- NEI[which(NEI$SCC %in% coal_scc),]

g <- ggplot(NEI_coal,aes(factor(year),Emissions/(10^5)))
my_plot <- g+geom_bar(stat = "identity")+ labs(y="Emissions from coal combustion-related sources (10^5)",x="Year (1999 - 2008)")

print(my_plot)

ggsave("E2plot4.png", plot = my_plot) 
