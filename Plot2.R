#load file into R

NEI <- readRDS("~/r/coursera/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/r/coursera/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

#subset data for Baltimore City, Maryland
library(dplyr)

emissionsBC <- filter(NEI, fips == 24510)
emissionsSum <- aggregate(Emissions ~ year, emissionsBC, sum)

#create histogram of data with proper labelling
png("Plot1.png", width = 480, height = 480)

barplot(emissionsSum$Emissions, 
        names.arg = emissionsSum$year, 
        main = "Total Emissions per Year in Baltimore City", 
        xlab = "Year", 
        ylab = "Emissions from PM2.5")

dev.off()

################################################

#Total emissions have descreased

################################################