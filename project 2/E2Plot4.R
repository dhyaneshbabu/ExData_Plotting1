library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_scc <- SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]
NEI_coal<- NEI[which(NEI$SCC %in% coal_scc),]

g <- ggplot(NEI_coal,aes((year),Emissions/(10^5)))
g+geom_bar(stat = "identity")+ labs(y="Emissions from coal combustion-related sources (10^5)",x="Year (1999 - 2008)")


dev.copy(png, file="E2plot4.png", height=480, width=480)
dev.off()