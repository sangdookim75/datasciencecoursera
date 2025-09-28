library(ggplot2)
NEI <- readRDS("~/summarySCC_PM25.rds")
SCC <- readRDS("~/Source_Classification_Code.rds")

motor_vehicle <- grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE)
SCC_motor_vehicle <- SCC[motor_vehicle,]
NEI_motor_vehicle <- merge(NEI, SCC_motor_vehicle, by="SCC")

baltimore_la <- subset(NEI_motor_vehicle, fips=="24510" | fips=="06037")
baltimore_la$city <- ifelse(baltimore_la$fips=="24510", "Baltimore", "LA")

Emissions <- aggregate(Emissions ~ year + city, baltimore_la, sum)


ggplot(Emissions, aes(x=year, y=Emissions, color=city)) +geom_line() + geom_point() + xlab("Year") + ylab("Total PM.25 Emissions (tons)") + ggtitle("Total Motor Vehicle Sources PM2.5 Emissions in Baltimore vs. LA")


dev.copy(png, file="plot6.png")
dev.off()