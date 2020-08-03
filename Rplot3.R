###################################################################
# Question 3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
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
#5. 
    library(ggplot2) 
###################################################################
v_emissions <- NEI %>%
    filter(fips == "24510") %>%
    group_by(year, type) %>%
    summarise(Emissions=sum(Emissions))

cbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7") 
c_plot <- ggplot(data = v_emissions, aes(x = factor(year), y = Emissions, fill = type)) +
    geom_bar(stat = "identity", colour= "black") + facet_grid(. ~ type) + 
    xlab("Year") + ylab(expression('PM'[2.5]*' Emission')) +
                                   ggtitle("Baltimore Emissions by Source Type") +
                                       scale_fill_manual(values=cbPalette)
                                   print(c_plot)