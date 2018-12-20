# prophet in R 
library(prophet)

df2 <- read.csv('prophet-data2.csv')
head(df2)
str(df2)


df2$ds <- as.Date(df2$ds) # Convert to date 


# use prophet to create a model 
m <- prophet(df2)

# create data frame of time period 
future <- make_future_dataframe(m, periods = 365)
tail(future) # adds predicted dates for forecast to be joined on 


# use predict to make forecast 
forecast <- predict(m, future)
tail(forecast[c('ds', 'yhat', 'yhat_lower', 'yhat_upper')])

# look at forecast compared to model object 
plot(m, forecast)

# break trend into seasonality componenet s
prophet_plot_components(m, forecast)

# interactive version 
dyplot.prophet(m, forecast)

