require(ggplot2)
#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
dd <- as.character(SCC[grepl("[Cc][Oo][Aa][Ll]", SCC$EI.Sector),1])
subNEI <- subset(NEI, (SCC %in% dd))


#Aggregate Statistic
tmp <- tapply(subNEI$Emissions, subNEI$year, sum)
tmp <- as.data.frame(tmp)

#open png graphic device
png(file = "plot4.png", width = 480, height = 480)


#Plot

d<- ggplot(tmp, aes(x = row.names(tmp), y= tmp, group =1))
d+ geom_line() + labs(y = "Emissions", x = "year") +
  labs(title = "Emissions from 1999-2008 from coal combustion-related sources")


#close graphic device
dev.off()
