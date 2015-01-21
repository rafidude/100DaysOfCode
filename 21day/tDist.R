#t Distribution
help(TDist)
x = seq(-3,3, by=0.1)
y = dt(x,df=10)
# t distribution curve
plot(x, y)
y = dt(x,df=50)
plot(x, y)
# cumulative dist curve
y = pt(x,df=10)
plot(x, y)
qnorm(c(0.85, 0.9, 0.95, 0.99))
qt(c(0.85, 0.9, 0.95, 0.99), df=10)
qt(c(0.85, 0.9, 0.95, 0.99), df=10) - qnorm(c(0.85, 0.9, 0.95, 0.99))

