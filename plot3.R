plot3 <- function(){
    library(ggplot2)
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

    ##get data of Baltimore City, Maryland
    baltimoreMd_NEI <- NEI[NEI$fips == "24510", ]
    
    findata <- aggregate(Emissions ~ year + type, baltimoreMd_NEI, sum)
    
    ##print(head(findata, 2))
    
    png("plot3.png", width = 650, height = 480)
    
    finplot <- qplot(year, Emissions, data = findata, color = type, geom = "line") + 
        ggtitle("Total PM2.5 Emissions in Baltimore City, Maryland by Sources") + 
        xlab("Year") + ylab("Emission Levels")
    
    print(finplot)
    dev.off()
}