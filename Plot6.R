NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIBaltimoreLA<-subset(NEI,(NEI$fips == "24510" | NEI$fips=="06037")&NEI$type=="ON-ROAD")
EmissionByYearByCity<-aggregate(NEIBaltimoreLA$Emission,list(NEIBaltimoreLA$year,NEIBaltimoreLA$fips),sum)
colnames(EmissionByYearByCity) <- c("Year","City","Emissions")
png("Plot6.png")
g<-qplot(Year,Emissions,data=EmissionByYearByCity,facets=City~.)+facet_grid(City~.,scales="free_y")+geom_smooth(method="lm")+labs(title="Motor Vehicle Emission By Year Baltimore Vs LA")
print(g)
dev.off()


