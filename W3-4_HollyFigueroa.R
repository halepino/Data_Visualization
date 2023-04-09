# DSC640: Week2Charts
# Name: Figueroa, Holly
# Date: 4/6/23
# Data Source: https://www.kaggle.com/datasets/jehanzaibbhatti/sales-data

library (plotly)
library(dplyr)
library(readxl)
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
  
 
# PLot Line chart Plotly
fig <- plot_ly(agg_df, x = agg_df$Year, 
               y = agg_df$yr_revenue, 
               type = 'scatter', 
               mode ='lines')



fig <- fig %>% layout(
                      title = 'LINE CHART: Sales Revenue',
                      xaxis = list(range = c(2010.5,2016.5),list(title = 'Year')),
                      yaxis = list(range = c(0,20)),list(title = 'Million')
                      )
                      
fig

# Plot Step Chart GGPLOT

ggplot(agg_df, aes(Year, yr_revenue)) + geom_step()+
  ggtitle('STEP CHART: Revenue by Year')+
  ylab('Million $')+
  theme(panel.grid = element_blank())
  
