# Two Sample t-test
library(SDSFoundations)
post <- PostSurvey
post10 = post[1:10,] 
table(post10$live_campus)

under = post$happy[post$classification=='Freshman'|post$classification=='Sophomore']
upper = post$happy[post$classification=='Junior'|post$classification=='Senior']
hist(under)
hist(upper)
t.test(under, upper)

post$diff_happy <- post$happy - post$post_happy
hist(post$diff_happy, xlab= 'Difference in Happiness over the Semester', main = 'Happy-Post Happy')
t.test(post$happy, post$post_happy, paired=T)

mean(under)
mean(upper)
mean(post$diff)
