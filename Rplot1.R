###################################################################
# Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
###################################################################
#Previous Steps
#1. 
    NEI <- readRDS("summarySCC_PM25.rds") 
#2. 
    SCC <- readRDS("Source_Classification_Code.rds")
#3. 
    library(RColorBrewer) 
###################################################################
t_annual_emissions <- aggregate(Emissions ~ year, NEI, FUN = sum)
coul <- brewer.pal(5, "Set2") 
with(t_annual_emissions, 
     barplot(height=Emissions/1000, names.arg = year, col = coul, 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Annual Emission PM'[2.5]*' from 1999 to 2008')))
