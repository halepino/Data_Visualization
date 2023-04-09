# DSC640: Week1Charts
# Name: Figueroa, Holly
# Date: 03/23/23

#1 bar chart, 1 stacked bar chart, 1 pie chart, and 1 donut with R

# import libraries
library(readxl)
library (plotly)
library(dplyr)
library(ggplot2)

# Set working directory
setwd("C:/DataLore")

# upload excel file to df
hotdog_df <- read_excel('DSC640/hotdog-contest-winners.xlsm')
head(hotdog_df)

# rename column
colnames(hotdog_df)[3] ="dogs_eaten"
colnames(hotdog_df)[5] ="new_record"

# Create Bar chart of the hotdogs eaten by winner over years
fig <- plot_ly(hotdog_df, x = hotdog_df$Year, y = hotdog_df$dogs_eaten, type = 'bar', color = 'coral')
fig <- fig %>% layout(title = "BAR CHART: Winning Hotdog Count by Year",
                      
                      xaxis = list(title = "Year"),
                      
                      yaxis = list(title = "Count"))
fig

# Get counts for contest winners by country
country <- as.data.frame(table(hotdog_df$Country))
country

#PLOTLY PIE CHART
fig <- plot_ly(type='pie', labels=country$Var1, values=country$Freq,
               textinfo='value',
               textposition='outside'
            )
fig <- fig %>% layout(title = "PIE CHART: Contest Winners by Country")
fig

# Upload second dataset for donut chart and stacked bar chart                     
poll_df <- read_excel('DSC640/obama-approval-ratings.xls')
poll_df

# PLOTLY STACKED BAR CHART
fig <- plot_ly(poll_df, x = ~Issue, y = ~Approve, type = 'bar', name = 'Approve', color = 'blue')

fig <- fig %>% add_trace(y = ~Disapprove, name = 'Disapprove', color = 'red')
fig <- fig %>% add_trace(y = ~None, name = 'None', color = 'gray')

fig <- fig %>% layout(yaxis = list(title = 'Count'), 
                       barmode = 'stack',
                       title = "STACKED BAR CHART: President Approval Ratings by Issue")

fig

# Donut Chart

# Get column means
myvalues <-c(mean(poll_df$Approve),mean(poll_df$Disapprove),mean(poll_df$None))
myvalues

# Get column names
mylabels <- colnames(poll_df)
mylabels
mylabels <- mylabels[-1]

# Plot Donut Chart
fig <- plot_ly(type='pie', labels=mylabels, values=myvalues,
                textinfo='value',
                textposition='outside',
                hole = 0.5
               )

fig <- fig %>% layout(title = "DONUT CHART: Average Presidential Approval Rates")

fig

