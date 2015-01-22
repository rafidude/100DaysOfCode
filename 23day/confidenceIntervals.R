# confidence interval using a normal distribution
# sample mean is 5, the standard deviation is 2, and the sample size is 20
mean = 5
s = 2
n = 20
err = qnorm(0.975)*s/sqrt(n)
left = mean - err
right = mean + err

# confidence interval using a t distribution
mean = 5
s = 2
n = 20
err = qt(0.975, df=n-1)*s/sqrt(n)
left = mean - err
right = mean + err

f = "/Users/agilesense/gocode/src/github.com/rafidude/100DaysOfCode/23day/w1.dat"
w1 <- read.csv(file=f,sep=",",head=TRUE)
summary(w1)
mean(w1$vals)
error <- qt(0.975,df=length(w1$vals)-1)*sd(w1$vals)/sqrt(length(w1$vals))
left <- mean(w1$vals)-error
right <- mean(w1$vals)+error
