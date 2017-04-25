#load file into R

NEI <- readRDS("~/r/coursera/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/r/coursera/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

#load packages
library(ggplot2)
library(dplyr)

#merge and subset data for desired fields
masterData <- merge(NEI, SCC, by = "SCC")

emissionsCoal <- grepl("coal", masterData$Short.Name, ignore.case = TRUE)
emissionsCoalSS <- masterData[emissionsCoal, ]

#Sum Coal Totals
emissionsSumByCoal <- aggregate(Emissions ~ year, emissionsCoalSS, sum)

#create histogram of data with proper labelling
png("Plot4.png", width = 480, height = 480)

g <- ggplot(emissionsSumByCoal, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity", fill = "dark blue") +
  xlab("Year") +
  ylab("Emissions from PM2.5") +
  ggtitle("Total Coal Emissions from 1999 to 2008")

print(g)

####################################################

#Coal emissions appear to have decreased from 1999-2008

####################################################

dev.off()