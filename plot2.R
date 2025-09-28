NEI <- readRDS("~/summarySCC_PM25.rds")
SCC <- readRDS("~/Source_Classification_Code.rds")

NEI2<-NEI[(NEI$fips=="24510"), ]
NEI2<-aggregate(NEI2$Emissions, by=list(NEI2$year), FUN=sum)
colnames(NEI2)<-c("year", "emission")

windows()

plot(NEI2$year, NEI2$emission, xlab="year", ylab="total emissions [tonnes]", pch=16)
reg<-lm(NEI2$emission~NEI2$year)
abline(reg, col="red")
legend("topright", legend=paste("R^2=",format(summary(reg)$adj.r.squared, digits=2)))
title("Total emissions of PM2.5 in Baltimore City\nin 1999-2008\n")

## save the plot
dev.copy(png, file="plot2.png")
dev.off()