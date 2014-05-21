require(ggplot2)
#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
dd <- as.character(SCC[grepl("Vehicles", SCC$EI.Sector),1])
subNEI <- subset(NEI, (SCC %in% dd))
subNEI <- subset(subNEI, fips %in% c("24510", "06037"))


#Aggregate Statistic
tmp <- aggregate(subNEI$Emissions, by = list(subNEI$year, subNEI$fips), FUN = "sum")
names(tmp)<- c("year", "fips", "Emissions")
tmp <- data.frame(tmp, city = "")
tmp$city <- "Los Angeles County"
tmp$city[tmp$fips == "24510"] <- "Baltimore City"

#open png graphic device
png(file = "plot6.png", width = 480, height = 480)


#Plot

d<- ggplot(tmp, aes(x = year, y= Emissions, col = city))
d+ geom_line() + labs(y = "Emissions", x = "year") +
  labs(title = "Emissions from motor vehicle sources 
       1999-2008 in Baltimore City and Los Angeles County")


#close graphic device
dev.off()
