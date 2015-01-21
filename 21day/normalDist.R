# From http://www.cyclismo.org/tutorial/R/probability.html
help(Distributions)
# height of normal distribution at x
dnorm(c(0, 1, 2))
# Cumulative Distribution Function
pnorm(c(0, 1, 2))
# inverse of pnorm, given probability outputs Z-score
qnorm(pnorm(c(0, 1, 2)))
qnorm(c(0.85, 0.9, 0.95, 0.99))
# normal distribution curve
x <- seq(-2,2,by=.1)
y <- dnorm(x)
plot(x,y)
#rnorm generates random numbers whose distribution is normal
rnorm(5)
# generate a histogram resembling normal distribution
y1 = rnorm(2000)
hist(y1, breaks=40)