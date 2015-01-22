f = "/Users/agilesense/gocode/src/github.com/rafidude/100DaysOfCode/23day/smoker.csv"
smokerData <- read.csv(file=f,sep=',',header=T)
summary(smokerData)

smoke <- matrix(c(51,43,22,92,28,21,68,22,9),ncol=3,byrow=TRUE)
colnames(smoke) <- c("High","Low","Middle")
rownames(smoke) <- c("current","former","never")
class(smoke)
smoket <- as.table(smoke)
class(smoket)
barplot(smoket,legend=T,beside=T,main='Smoking Status by SES')
plot(smoket,main="Smoking Status By Socioeconomic Status")
smoket
margin.table(smoket)
smoket/margin.table(smoket)
prop.table(smoket)
prop.table(smoket,1)
prop.table(smoket,2)
summary(smoket)

help(mosaicplot)
smoke <- table(smokerData$Smoke,smokerData$SES)
mosaicplot(smoke)
mosaicplot(smoke,main="Smokers",xlab="Status",ylab="Economic Class")
