library(ggplot2)
NEI <- readRDS("~/summarySCC_PM25.rds")
SCC <- readRDS("~/Source_Classification_Code.rds")

coal <- grepl("coal", SCC$EI.Sector, ignore.case=TRUE)
SCC_coal <- SCC[coal,]
NEI_coal <- merge(NEI, SCC_coal, by="SCC")

#get total emissions by year then save it to a data frame
coal_sum <- tapply(NEI_coal$Emissions, NEI_coal$year, sum)
coal_sum <- as.data.frame(coal_sum)
names(coal_sum)[1] <- "Emissions"
rownames(coal_sum) <- c(1:4)
coal_sum$Year <- c(1999, 2002, 2005, 2008)


ggplot(coal_sum, aes(x=Year, y=Emissions)) +
  geom_line() + geom_point() + xlab("Year") + ylab("Total PM.25 Emissions (tons)") + ggtitle("Total PM2.5 Emissions from Coal Combustion-Related Sources by Year")


dev.copy(png, file="plot4.png")
dev.off()
