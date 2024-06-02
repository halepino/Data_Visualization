# DSC640: Week7-8 Charts
# Name: Figueroa, Holly
# Data Source: https://www.kaggle.com/datasets/jehanzaibbhatti/sales-data
# Objective: 1 scatter plot, 1 bubble chart, 1 density plot chart using R

library(treemap)
library(ggplot2)
library(dplyr)

df<-read.csv('crime_ed_money.csv')
head(df)

# Create Scatter plot

ggplot(df, aes(Ed_Degree, burglary))+
  geom_point(color='steelblue', alpha = .8)+
  ylab('Burglary Rates')+
  xlab('% Population with College Degree')+
  ggtitle('SCATTER PLOT: State Burglary Rates & Population% with 4yr Degree HLA')+
  theme(plot.title=element_text(size=12))

# Create Bubble chart
ggplot(df, aes(Ed_Degree, burglary, size = population ))+
  geom_point(color='steelblue',alpha = .5)+
  scale_size(range = c(2,12))+
  ylab('Burglary Rates')+
  xlab('% Population with College Degree')+
  ggtitle('BUBBLE PLOT: State Burglary Rates & Population % with 4yr Degree HLA')+
  theme(plot.title=element_text(size=12))

# Create Density plot
ggplot(df, aes(Ed_Degree))+
  geom_density(fill='steelblue', alpha = .8)+
  ylab('Burglary Rates')+
  xlab('% Population with College Degree')+
  ggtitle('DENSITY PLOT: US State Populations % with 4yr Degree HLA')+
  theme(plot.title=element_text(size=12))
