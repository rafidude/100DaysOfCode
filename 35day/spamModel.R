setwd("/Users/agilesense/gocode/src/github.com/rafidude/100DaysOfCode/35day")
spamD <- read.table('spamD.tsv',header=T,sep='\t')
head(spamD)
spamTrain <- subset(spamD,spamD$rgroup>=10)
spamTest <- subset(spamD,spamD$rgroup<10)
spamVars <- setdiff(colnames(spamD),list('rgroup','spam'))
spamFormula <- as.formula(paste('spam=="spam"',paste(spamVars,collapse=' + '),sep=' ~ '))
spamModel <- glm(spamFormula,family=binomial(link='logit'),data=spamTrain)
spamTrain$pred <- predict(spamModel,newdata=spamTrain, type='response')
spamTest$pred <- predict(spamModel,newdata=spamTest, type='response')
print(with(spamTest,table(y=spam,glmPred=pred>0.5)))
head(spamTest$spam)
head(spamTest$pred)

ggplot(data=spamTest) + geom_density(aes(x=pred,color=spam,linetype=spam))

install.packages("")
library('ROCR')
eval <- prediction(spamTest$pred,spamTest$spam) 
plot(performance(eval,"tpr","fpr")) 
print(attributes(performance(eval,'auc'))$y.values[[1]])

# Log Likelihood
sum(ifelse(spamTest$spam=='spam', log(spamTest$pred), log(1-spamTest$pred)))
sum(ifelse(spamTest$spam=='spam', log(spamTest$pred), log(1-spamTest$pred)))/dim(spamTest)[[1]]
