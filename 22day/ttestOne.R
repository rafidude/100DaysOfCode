library(SDSFoundations)
bull <- BullRiders
year = 2013 - bull$YearBorn
hist(year)
t.test(year, mu=27.57)

hist(bull$Weight)
mean(bull$Weight)
sd(bull$Weight)
t.test(bull$Weight, mu=190)
