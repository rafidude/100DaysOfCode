# predict the probability of insurance coverage: age, employment status, income, information about residence and vehicles, and so on. 
custdata <- read.table('custdata.tsv',header=T,sep='\t')
head(custdata)
names(custdata)
summary(custdata$age)
hist(custdata$age)
summary(custdata)
hist(custdata$income)
table(custdata$is.employed)
library(ggplot2)
ggplot(custdata) + geom_histogram(aes(x=age), binwidth=5, fill="gray")
library(scales)
ggplot(custdata) + geom_density(aes(x=income)) + scale_x_continuous(labels=dollar)
ggplot(custdata) + geom_density(aes(x=income)) + scale_x_log10(breaks=c(100,1000,10000,100000), labels=dollar) + annotation_logticks(sides="bt")
ggplot(custdata) + geom_bar(aes(x=marital.stat), fill="gray")
ggplot(custdata) +
  geom_bar(aes(x=state.of.res), fill="gray") +
  coord_flip() +
  theme(axis.text.y=element_text(size=rel(0.8)))

x <- runif(100)
y <- x^2 + 0.2*x
ggplot(data.frame(x=x,y=y), aes(x=x,y=y)) + geom_line()

custdata2 <- subset(custdata, (custdata$age > 20 & custdata$age < 80 & custdata$income > 10000 & custdata$income < 200000))
hist(custdata2$age)
hist(custdata2$income)
cor(custdata2$age, custdata2$income)
ggplot(custdata2, aes(x=age, y=income)) + geom_point() + stat_smooth(method="lm")
ggplot(custdata2, aes(x=age, y=income)) + geom_point() + geom_smooth()
custdata2$incomek = custdata2$income/1000
ggplot(custdata2, aes(x=age, y=incomek)) + geom_point() + geom_smooth()

install.packages("hexbin")
library(hexbin)
ggplot(custdata2, aes(x=age, y=income)) + geom_hex(binwidth=c(5, 10000)) + geom_smooth(color="white", se=F)
