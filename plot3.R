require(ggplot2)
#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subNEI <- subset(NEI, fips == "24510")
#Aggrigate Statistic
tmp <- tapply(subNEI$Emissions, list(subNEI$year, subNEI$type) , sum, simplify= FALSE)


#open png graphic device
png(file = "plot2.png", width = 480, height = 480)

tmp <- as.data.frame(tmp)
#Plot
d <- ggplot(tmp, aes(x=row.names(tmp), y=tmp[,1])) +geom_line()
print(d)

#close graphic device
dev.off()
