plot5 <- function(){
    library(ggplot2)
    
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    motorvehicle_NEI <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
    findata <- aggregate(Emissions ~ year + type + fips, motorvehicle_NEI, sum)
    
    png("plot5.png", width = 500, height = 500)
    
    finplot <- qplot(year, Emissions, data = findata, geom = "line") +
            ggtitle("Motor Vehicle Emissions in Baltimore City") +
            xlab("Year") + ylab("Emission Levels")
    
    print(finplot)
    dev.off()
    
    
}