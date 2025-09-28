library(ggplot2)
NEI <- readRDS("~/summarySCC_PM25.rds")
SCC <- readRDS("~/Source_Classification_Code.rds")

NEI3<-NEI[(NEI$fips=="24510"), ]
NEI3<-aggregate(NEI3$Emissions, by=list(NEI3$year, NEI3$type), FUN=sum)
colnames(NEI3)<-c("year", "type", "emissions")

windows()

qplot(year, emissions, data=NEI3, color=type, geom=c("point", "smooth"),
      method="lm", ylab="total emissions [tonnes]",
      main="Changes in total emissions of PM2.5\nin Baltimore City in 1999-2008 by source\n") 

dev.copy(png, file="plot3.png")
dev.off()
