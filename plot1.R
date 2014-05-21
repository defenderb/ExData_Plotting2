#Loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate Statistic
tmp <- tapply(NEI$Emissions, NEI$year, sum)

#open png graphic device
png(file = "plot1.png", width = 480, height = 480)

#Plot
plot(names(tmp), tmp, type = "l", main = expression("Total emission " *  PM[2.5]),
     ylab = expression("Emission " *  PM[2.5]), xlab="")

#close graphic device
dev.off()