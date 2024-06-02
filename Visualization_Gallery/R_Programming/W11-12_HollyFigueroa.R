# DSC640: Week11-12 Charts
# Name: Figueroa, Holly
# Objective:  1 histogram, 1 box plot, 1 bullet chart, and 1 additional chart of your choice

library(ggplot2)
library(dplyr)
library(plotly)

df<-read.csv('education.csv')
head(df)

drop_count<-df%>%
  count(dropout_rate)

drop_count

# Histogram

ggplot(data = df, aes(x=dropout_rate)) + 
  geom_histogram(binwidth = 1, fill = 'steelblue')+
  ylab('Frequency')+
  xlab('Dropout Rate')+
  ggtitle('HISTOGRAM: State Dropout Rates')+
  theme_minimal()

# Box plot
ggplot(df, aes(x = dropout_rate, y = "")) +
  geom_boxplot(fill = "lightblue", color = "black") +
  xlab("Dropout Rate")+
  ylab('') +
  labs(title = "BOX PLOT: State Dropout Rates") +
  theme_minimal()

# Bullet chart

target<-mean(df$math)


fig <- plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  gauge = list(shape = "bullet"),
  delta = list(reference = target),
  value = 552,
  domain = list(x = c(0, 1), y = c(0, 1)),
  title= list(text = "Rate"),
  height = 150)

fig

# Violin plot

fig <- df %>%
  plot_ly(
    y = ~math,
    type = 'violin',
    box = list(visible = T),
    meanline = list(visible = T)
  )

fig <- layout(
  fig,
  title = 'VIOLIN PLOT: US State Math Scores')

fig

