#load file into R

NEI <- readRDS("~/r/coursera/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/r/coursera/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

#load packages
library(ggplot2)
library(dplyr)

#subset data for Baltimore City, Maryland
emissionsBC <- filter(NEI, fips == 24510)
emissionsSumByType <- aggregate(Emissions ~ year + type, emissionsBC, sum)

#create histogram of data with proper labelling
png("Plot3.png", width = 480, height = 480)

g <- ggplot(emissionsSumByType, aes(year, Emissions, color = type))
g <- g + geom_line() +
    xlab("Year") +
    ylab("Emissions from PM2.5") +
    ggtitle("Total Emissions per Year in Baltimore City")

print(g)

####################################################

#Total emissions appear to decrease for all types, however
#Point submissions increased during 2005 before decreasing

####################################################

dev.off()