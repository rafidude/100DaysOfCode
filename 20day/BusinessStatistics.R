# Basic Statistical Measures in Business Statistics
boxes = c(235, 337, 248, 317, 402, 237, 345)
hist(boxes)
mean(boxes)
?fivenum
stats = fivenum(boxes)
names(stats) = c('min', '25Perc', 'median', '75Perc', 'max')
stats
iqr = stats['75Perc'] - stats['25Perc']
iqr
sd(boxes)
?pnorm
?Normal

