
setwd("~/Documents/Tarantula Project")
library(priceR)
library(dplyr)

# ------------- Cleaning and Combining Datasets ---------

Tarantula <- read.csv("Tarantula_Data.csv")

#Getting exchange rates from USD to PLN from 2013 to 2019
cur <- historical_exchange_rates("USD", to = "PLN",
                                 start_date = "2013-01-01", end_date = "2022-03-01")

colnames(cur) <- c('Date','1_USD_to_PLN') #changing column names

#making sure the date columns are formatted as dates
cur$Date <- as.Date(cur$Date, format = "%Y.%m.%d")
Tarantula$Date <- as.Date(Tarantula$Date)

#merging the two datasets together for rows where they share a date
merged <- right_join(cur, Tarantula, by = "Date") 



