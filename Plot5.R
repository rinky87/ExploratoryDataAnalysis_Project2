NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIBaltimore<-subset(NEI,NEI$fips=="24510")
NEIBaltimoreMotor<-subset(NEIBaltimore,NEIBaltimore$type=="ON-ROAD"
pm25TotalByYear<-aggregate(Emissions~year,NEIBaltimoreMotor,sum)
png("Plot5.png")
barplot(pm25TotalByYear$Emissions,names.arg=pm25TotalByYear$year,main="Total Emission from Motor Vehicle Baltimore by Year",xlab="Year",ylab="PM2.5 Emission")
dev.off()
