library(ggplot2)
NEI <- readRDS("~/summarySCC_PM25.rds")
SCC <- readRDS("~/Source_Classification_Code.rds")

motor_vehicle <- grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE)
SCC_motor_vehicle <- SCC[motor_vehicle,]
NEI_motor_vehicle <- merge(NEI, SCC_motor_vehicle, by="SCC")

baltimore <- subset(NEI_motor_vehicle, fips=="24510")

balt_motor_vehicle <- tapply(baltimore$Emissions, baltimore$year, sum)

#change to data frame so it can be plotted
balt_motor_vehicle <- as.data.frame(balt_motor_vehicle)
names(balt_motor_vehicle)[1] <- "Emissions"
rownames(balt_motor_vehicle) <- c(1:4)
balt_motor_vehicle$Year <- c(1999, 2002, 2005, 2008)

ggplot(balt_motor_vehicle, aes(x=Year, y=Emissions)) +geom_line() + geom_point() + xlab("Year") + ylab("Total PM.25 Emissions (tons)") + ggtitle("Total PM2.5 Emissions from Motor Vehicle Sources in Baltimore by Year")

dev.copy(png, file="plot5.png")
dev.off()
