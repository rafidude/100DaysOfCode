custdata <- read.table('../34day/custdata.tsv',header=T,sep='\t')
custdata2 <- subset(custdata, (custdata$age > 20 & custdata$age < 80 & custdata$income > 10000 & custdata$income < 200000))
library(hexbin)
ggplot(custdata2, aes(x=age, y=income)) +  geom_hex(binwidth=c(5, 10000)) + geom_smooth(color="white", se=F)
ggplot(custdata) + geom_bar(aes(x=marital.stat, fill=health.ins))
ggplot(custdata) + geom_bar(aes(x=marital.stat, fill=health.ins), position='dodge')
ggplot(custdata) + geom_bar(aes(x=marital.stat, fill=health.ins), position='fill')

ggplot(custdata, aes(x=marital.stat)) + geom_bar(aes(fill=health.ins), position="fill") + geom_point(aes(y=-0.05), size=0.75, alpha=0.3, position=position_jitter(h=0.01))
