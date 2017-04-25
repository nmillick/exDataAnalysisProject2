#load file into R

NEI <- readRDS("~/r/coursera/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/r/coursera/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

#create histogram of data with proper labelling

emissionsSum <- aggregate(Emissions ~ year, NEI, sum)

png("Plot1.png", width = 480, height = 480)

barplot(emissionsSum$Emissions, 
        names.arg = emissionsSum$year, 
        main = "Total Emissions per Year", 
        xlab = "Year", 
        ylab = "Emissions from PM2.5")

dev.off()

################################################

#Total emissions have descreased

################################################



