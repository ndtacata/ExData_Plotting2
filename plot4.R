plot4 <- function(){
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    ##get coal combustion related data
    
    SCC_data <- SCC[grepl("Coal" , SCC$Short.Name), ]
    NEI_data <- NEI[NEI$SCC %in% SCC_data$SCC, ]
    
    png("plot4.png", width = 500, height = 500)
    
    finplot <- ggplot(NEI_data, aes(x = factor(year), y = Emissions, fill = type)) + 
        geom_bar(stat= "identity") + xlab("Year") + ylab("Coal Combustion Related PM2.5 Emissions") + 
        ggtitle("Total Coal Combustion Related PM2.5 Emissions by Type")
    
    print(finplot)
    dev.off()

}