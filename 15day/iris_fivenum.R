iris
iris.set = iris[iris$Species=="setosa",-5]
iris.versi = iris[iris$Species=="versicolor",-5]
iris.virg = iris[iris$Species=="virginica",-5]
mean.set <- colMeans(iris.set)
mean.versi <- colMeans(iris.versi)
mean.virg <- colMeans(iris.virg)
mean.iris <- rbind(mean.set,mean.versi,mean.virg)
rownames(mean.iris) <- c("setosa","versicolor","virginica")
aggregate(iris[,-5], list(iris$Species), mean)
