require(ggplot2)
#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
subNEI <- subset(NEI, fips == "24510")

#Aggregate Statistic
tmp <- aggregate(subNEI$Emissions, by = list(subNEI$year, subNEI$type), FUN = "sum")
names(tmp) <- c("year", "type", "Emissions")

#open png graphic device
png(file = "plot3.png", width = 480, height = 480)


#Plot
qplot(data = tmp, x=year, y=Emissions, col = type, geom = "line",
      main = "Emissions from 1999-2008 for Baltimore City")


#close graphic device
dev.off()