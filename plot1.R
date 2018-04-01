plot1 <- function() {
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    findata <- aggregate(Emissions ~ year, NEI, sum)
    
    png("plot1.png", width = 500, height = 500)
    
    barplot(height = findata$Emissions, names.arg = findata$year, 
            col = "light blue", xlab = "Year", ylab = "Emission Levels", 
            main = "Total PM2.5 Emissions at various years")
    dev.off()
}