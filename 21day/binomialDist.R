# Binomial Distribution Functions
help(Binomial)
# size:  number of trials (zero or more).
# prob: probability of success on each trial.

# distribution function, dbinom
x <- seq(0,50,by=1)
y <- dbinom(x,50,0.5)
plot(x,y)
pbinom(24,50,0.5)
pbinom(25,50,0.5)
x = seq(15,35)
y = rep(NA, 21)
for (i in x) {
  z <- pbinom(i, 50, 0.5)
  j = i - 15
  y[j] = z
}
plot(x,y)

# inverse CDF
x = seq(-0, 1, 0.05)
y = rep(NA, 21)
j = 0
for (i in x){
  j = j + 1
  y[j] = qbinom(i,50,1/2)
}
plot(x, y)
