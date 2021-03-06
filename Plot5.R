#load file into R

NEI <- readRDS("~/r/coursera/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/r/coursera/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

#load packages
library(ggplot2)
library(dplyr)

#merge and subset data for desired fields
masterData <- merge(NEI, SCC, by = "SCC")

emissionsVehicle <- grepl("vehicle", masterData$SCC.Level.Two, ignore.case = TRUE)
emissionsVehicleSS <- masterData[emissionsVehicle, ]
emissionsVehicleSS <- filter(emissionsVehicleSS, fips == "24510")

#Sum Vehicle Totals
emissionsSumByVehicle <- aggregate(Emissions ~ year, emissionsVehicleSS, sum)

#create histogram of data with proper labelling
png("Plot5.png", width = 480, height = 480)

g <- ggplot(emissionsSumByVehicle, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity", fill = "dark green") +
  xlab("Year") +
  ylab("Emissions from PM2.5") +
  ggtitle("Vehicle Emissions in Baltimore City (1999-2008)")

print(g)

####################################################

#Vehicle emissions in Baltimore City appear to have decreased from 1999-2008

####################################################

dev.off()