plot2 <- function(){
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    ##get data of Baltimore City, Maryland
    baltimoreMd_NEI <- NEI[NEI$fips == "24510", ]
    
    findata <- aggregate(Emissions ~ year, baltimoreMd_NEI, sum)
    
    png("plot2.png", width = 500, height = 500)
    
    barplot(height = findata$Emissions, names.arg = findata$year, 
            col = "light blue", xlab = "Year", ylab = "Emission Levels", 
            main = "Total PM2.5 Emissions in Baltimore City, Maryland at various years")
    dev.off()
}