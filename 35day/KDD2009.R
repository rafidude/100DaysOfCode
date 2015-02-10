setwd("/Users/agilesense/code/play/PDataSci/KDD2009")
d <- read.table('orange_small_train.data.gz', header=T, sep='\t', na.strings=c('NA',''))
head(d)
churn <- read.table('orange_small_train_churn.labels.txt', header=F, sep='\t')
d$churn <- churn$V1
appetency <- read.table('orange_small_train_appetency.labels.txt', header=F, sep='\t')
d$appetency <- appetency$V1
upselling <- read.table('orange_small_train_upselling.labels.txt', header=F, sep='\t')

d$upselling <- upselling$V1
set.seed(729375)
d$rgroup <- runif(dim(d)[[1]])
dTrainAll <- subset(d,rgroup<=0.9)
dTest <- subset(d,rgroup>0.9)
outcomes=c('churn','appetency','upselling')
vars <- setdiff(colnames(dTrainAll), c(outcomes,'rgroup'))
catVars <- vars[sapply(dTrainAll[,vars],class) %in% c('factor','character')]
numericVars <- vars[sapply(dTrainAll[,vars],class) %in% c('numeric','integer')] 
rm(list=c('d','churn','appetency','upselling'))
outcome <- 'churn'
pos <- '1'
useForCal <- rbinom(n=dim(dTrainAll)[[1]],size=1,prob=0.1)>0
dCal <- subset(dTrainAll,useForCal)
dTrain <- subset(dTrainAll,!useForCal)

mkPredC <- function(outCol,varCol,appCol) {
  pPos <- sum(outCol==pos)/length(outCol)
  naTab <- table(as.factor(outCol[is.na(varCol)]))
  pPosWna <- (naTab/sum(naTab))[pos]
  vTab <- table(as.factor(outCol),varCol)
  pPosWv <- (vTab[pos,]+1.0e-3*pPos)/(colSums(vTab)+1.0e-3)
  pred <- pPosWv[appCol]
  pred[is.na(appCol)] <- pPosWna
  pred[is.na(pred)] <- pPos
  pred
}

for(v in catVars) {
  pi <- paste('pred',v,sep='')
  dTrain[,pi] <- mkPredC(dTrain[,outcome],dTrain[,v],dTrain[,v])
  dCal[,pi] <- mkPredC(dTrain[,outcome],dTrain[,v],dCal[,v])
  dTest[,pi] <- mkPredC(dTrain[,outcome],dTrain[,v],dTest[,v])
}

install.packages('ROCR')
