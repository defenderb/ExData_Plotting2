#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
subNEI <- subset(NEI, fips == "24510")

#Aggregate Statistic
tmp <- tapply(subNEI$Emissions, subNEI$year, sum)


#open png graphic device
png(file = "plot2.png", width = 480, height = 480)


#Plot
plot(names(tmp), tmp, type = "l", main = expression("Total emission " *  PM[2.5] * " in Baltimore City"),
     ylab = expression("Emission " *  PM[2.5]), xlab="")

#close graphic device
dev.off()
