library(SDSFoundations)
world <- WorldBankData
us = world[world$Country == "United States",]
us_select = us[us$year >= 1990,]

us_select$internet.mil = us_select$internet.users/1000000
# Create a new variable that is "years since 1990"
us_select$time <- us_select$year - 1990

us_select_10 <- us_select[us_select$time < 10,]
linFit(us_select_10$time, us_select_10$internet.mil)
expFit(us_select_10$time, us_select_10$internet.mil)
logisticFit(us_select_10$time, us_select_10$internet.mil)
e <- expFitPred(us_select_10$time, us_select_10$internet.mil, 16)
l <- logisticFitPred(us_select_10$time, us_select_10$internet.mil, 16)
us_select[us_select$time == 16, c("Country", "year", "internet.mil")]
us_select$internet.mil[us_select$time == 16] - e
us_select$internet.mil[us_select$time == 16] - l

# Look at the model fits for all available data (1990 to 2012)
expFit(us_select$time, us_select$internet.mil)
logisticFit(us_select$time, us_select$internet.mil)
# Which model fits the best?
tripleFit(us_select$time, us_select$internet.mil)
expFitPred(us_select_10$time, us_select_10$internet.mil, 22)
