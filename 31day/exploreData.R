# Categorical colors, genders
# Continuous mileage, height
library(datasets)
data(iris)
range(iris$Sepal.Length)
diff(range(iris$Sepal.Length))
summary(iris$Sepal.Length)
summary(iris)

boxplot(iris$Sepal.Length)
boxplot(iris[1:4])

install.packages("psych")
library(psych)
describeBy(iris, group=iris$Species)
library(lattice)
histogram(~Sepal.Length|Species, data=iris, layout=c(1,3), col="black")

boxplot(Sepal.Length ~ Species, data = iris)
