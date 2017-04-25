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

#city subsetting
emissionsBalt <- filter(emissionsVehicleSS, fips == "24510")
emissionsBalt$city <- "Baltimore City"

emissionsLA <- filter(emissionsVehicleSS, fips == "06037")
emissionsLA$city <- "Los Angeles County"

#combining city subsets
emissions <- rbind(emissionsBalt, emissionsLA)

#create histogram of data with proper labelling
png("Plot5.png", width = 480, height = 480)

g <- ggplot(emissions, aes(factor(year), Emissions))
g <- g + facet_grid(.~ city)
g <- g + geom_bar(stat= "identity") +
  xlab("Year") +
  ylab("Emissions from PM2.5") +
  ggtitle("Vehicle Emissions: Baltimore vs LA (1999 - 2008)")

print(g)

####################################################

#Vehicle emissions in Baltimore City appear to be much less than emissions in LA County

####################################################

dev.off()