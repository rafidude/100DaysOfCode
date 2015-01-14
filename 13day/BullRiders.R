bull <- BullRiders
plot(bull$RidePer, bull$Top10)
abline(lm(bull$Top10~bull$RidePer))
cor(bull$RidePer, bull$Top10)
hist(bull$RidePer)
fivenum(bull$RidePer)
mean(bull$RidePer)
sd(bull$RidePer)
hist(bull$Top10)
fivenum(bull$Top10)
mean(bull$Top10)
sd(bull$Top10)
bull$RidePer > 0.6
which(bull$Top10==5 & bull$RidePer==.53)
