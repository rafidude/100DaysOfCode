help(Chisquare)
# Chisquare Density function plot
x = seq(-10,30,by=.5)
y = dchisq(x,df=10)
plot(x, y)
y = dchisq(x,df=20)
plot(x, y)
# CDF
x = c(2,4,5,6)*4
pchisq(x,df=20)
# inverse cumulative probability distribution function
qchisq(0.05,df=10)
qchisq(0.95,df=10)
x = seq(0, 1, 0.05)
y = qchisq(x, df=10)
plot(x, y)
# random numbers can be generated using Chi-Squared distribution
rchisq(3,df=10)
rchisq(3,df=20)
rchisq(3,df=20)
