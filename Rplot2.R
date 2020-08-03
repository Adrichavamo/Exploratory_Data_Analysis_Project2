###################################################################
# Question 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 					 
###################################################################
#Previous Steps
#1. 
    NEI <- readRDS("summarySCC_PM25.rds") 
#2. 
    SCC <- readRDS("Source_Classification_Code.rds")
#3. 
    library(dplyr) 
#4. 
    library(RColorBrewer) 
###################################################################
total_emissions <- NEI %>%
    filter(fips == "24510") %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))
coul <- brewer.pal(3, "RdBu") 
with(total_emissions,
     barplot(height=Emissions/1000, names.arg = year, col = coul, 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
                                              main = expression('Baltimore, Maryland Emissions from 1999 to 2008'))
)