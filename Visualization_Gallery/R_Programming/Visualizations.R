# DSC640: Week2Charts
# Name: Figueroa, Holly
# Date: 4/6/23
# Data Source: https://www.kaggle.com/datasets/jehanzaibbhatti/sales-data

library(dplyr)
library(ggplot2)

#1 Create line chart and step chart

# Set working directory
setwd("C:/DataLore/DSC640/Data_Visualization")
getwd()

# load file world population data
df<- read.csv('sales_data.csv')
head(df)

# View date range
max(df$Year)
min(df$Year)

# Group by year and get aggregate revenue data
agg_df<- df%>% group_by(Year) %>%
  summarise(yr_revenue = sum(Revenue)/1000000)%>%
  as.data.frame()

agg_df
  
 
# PLot Line chart GGPLOT
ggplot(agg_df, aes(Year, yr_revenue)) + geom_line()+
  ggtitle('LINE CHART: Revenue by Year')+
  ylab('Million $')+
  theme(panel.grid = element_blank())+
  coord_cartesian(ylim = c(0, 20))
  

# Plot Step Chart GGPLOT
ggplot(agg_df, aes(Year, yr_revenue)) + geom_step(direction  = 'vh')+
  ggtitle('STEP CHART: Revenue by Year')+
  ylab('Million $')+
  theme(panel.grid = element_blank())+
  coord_cartesian(ylim = c(0, 20))
  
