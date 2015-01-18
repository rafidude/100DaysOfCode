library(SDSFoundations) 
survey <- StudentSurvey
# Calculate the population parameters
hist(survey$happy)
fivenum(survey$happy)
mean(survey$happy)
sd(survey$happy)


# Draw 1,000 samples of n=5 and find the mean of each sample.
xbar5 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =5)
 xbar5[i] <-  mean(x)}


# Graph the histogram of 1,000 sample means.
hist(xbar5,xlim=c(50,100))


# Calculate the mean and sd of the sampling distribution.
mean(xbar5)
sd(xbar5)

# Compare to the std dev predicted by the CTL.
sd(survey$happy)/sqrt(5)


#Repeat for samples of size n=15
xbar15 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =15)
 xbar15[i] <- mean(x)}
hist(xbar15,xlim=c(50,100))
mean(xbar15)
sd(xbar15)
sd(survey$happy)/sqrt(15)


#Repeat for samples of size n=25
xbar25 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =25)
 xbar25[i] <- mean(x)}
hist(xbar25,xlim=c(50,100))
mean(xbar25)
sd(xbar25)
sd(survey$happy)/sqrt(25)