plot6 <- function(){
    library(ggplot2)
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    motorvehicle_NEI_balt <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
    baltimore_data <- aggregate(Emissions ~ year + type + fips, motorvehicle_NEI_balt, sum)
    
    ##print(head(baltimore_data, 2))
    
    motorvehicle_NEI_la <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD", ]
    la_data <- aggregate(Emissions ~ year + type + fips, motorvehicle_NEI_la, sum)
    
    ##print(head(la_data, 2))
    
    findata <- rbind(baltimore_data, la_data)
    
    png("plot6.png", width = 500, height = 500)
    
    finplot <- qplot(year, Emissions, data = findata, color = fips, geom = "line", ylim = c(-100, 5500)) + 
        ggtitle("Motor Vehicle Emissions in Baltimore \n vs. \n Motor Vehicle Emissions in Los Angeles") +
        xlab("Year") + ylab("Emission Levels")
    
    print(finplot)
    dev.off()
}