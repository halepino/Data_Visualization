# DSC640: Week5-6 Charts
# Name: Figueroa, Holly
# Data Source: https://www.kaggle.com/datasets/jehanzaibbhatti/sales-data
# Objective: 1 tree map, 1 area chart and 1 stacked area chart using R

library(treemap)
library(ggplot2)

df<-read.csv('Sales_data.csv')
head(df)


# Create Treemap
treemap(df, #Your data frame object
        index= c("Product_Category", "Sub_Category"),  #A list of your categorical variables
        vSize = "Profit",  #This is your quantitative variable
        type="index", 
        title="TREEMAP:Profits by Category & Subcategory",
        fontsize.title = 14 #Change the font size of the title
)

# Group by year and get sum profit by year
sum_df<- df%>% group_by(Year) %>%
  summarise(yr_profit = sum(Profit)/1000000)%>%
  as.data.frame()

head(sum_df)

# Create Area Chart
ggplot(sum_df, aes(Year, yr_profit)) + 
  geom_area(fill = 5, alpha = .7) +
  ggtitle('AREA CHART: Profits by Year')+
  xlab('Million $')

# Group by year and product category to make stacked area
sum_cat_df<- df%>% group_by(Year, Country) %>%
  summarise(yr_profit = sum(Profit)/1000000)%>%
  as.data.frame()

head(sum_cat_df)

# Create stacked area chart
ggplot(sum_cat_df, aes(Year, yr_profit, fill = Country)) + 
  geom_area(alpha = .7) +
  ggtitle('STACKED AREA CHART: Country Profit Sum by Year')+
  ylab('Million')
  
