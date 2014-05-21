require(ggplot2)
#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
dd <- as.character(SCC[grepl("Vehicles", SCC$EI.Sector),1])
subNEI <- subset(NEI, (SCC %in% dd))
subNEI <- subset(subNEI, fips == "24510")


#Aggregate Statistic
tmp <- tapply(subNEI$Emissions, subNEI$year, sum)
tmp <- as.data.frame(tmp)

#open png graphic device
png(file = "plot5.png", width = 480, height = 480)


#Plot

d<- ggplot(tmp, aes(x = row.names(tmp), y= tmp, group =1))
d+ geom_line() + labs(y = "Emissions", x = "year") +
  labs(title = "Emissions from motor vehicle sources 1999-2008 in Baltimore City")


#close graphic device
dev.off()
