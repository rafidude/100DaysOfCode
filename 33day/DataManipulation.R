set.seed(1234) # setting seed to reproduce the example
numvar <- rnorm(100)
num2factor <- cut(numvar,breaks=5)
class(num2factor)
levels(num2factor)
table(num2factor)

iris.set <- iris[iris$Species=="setosa",-5]
iris.versi <- iris[iris$Species=="versicolor",-5]
iris.virg <- iris[iris$Species=="virginica",-5]

mean.set <- colMeans(iris.set)
mean.versi <- colMeans(iris.versi)
mean.virg <- colMeans(iris.virg)

mean.iris <- rbind(mean.set,mean.versi,mean.virg)
rownames(mean.iris) <- c("setosa","versicolor","virginica")

# split-apply-combine using loop
mean.iris.loop <- NULL
for(species in unique(iris$Species))
{
  iris_sub <- iris[iris$Species==species,]
  column_means <- colMeans(iris_sub[,-5])
  mean.iris.loop <- rbind(mean.iris.loop,column_means)
}
rownames(mean.iris.loop) <- unique(iris$Species)

# above loop with plyr 
library (plyr)
ddply(iris,~Species,function(x) colMeans(x[,-which(colnames(x)=="Species")]))

dim(iris3)
iris_mean <- adply(iris3,3,colMeans)
iris_mean
iris_mean <- aaply(iris3,3,colMeans)

all_stats <- alply(iris3,3,summary)

library(sqldf)
iris$SW = iris$Sepal.Width
subiris<- sqldf("select * from iris where SW > 3")
head(subiris)
