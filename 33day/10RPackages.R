# http://blog.yhathq.com/posts/10-R-packages-I-wish-I-knew-about-earlier.html
install.packages("sqldf")
library(sqldf)
head(beaver2)
sqldf("SELECT
        day
        , avg(temp) as avg_temp
      FROM beaver2
      GROUP BY
        day;")
beavers <- sqldf("select * from beaver1
                  union all
                  select * from beaver2;")
head(beavers)
movies <- data.frame(
  title=c("The Great Outdoors", "Caddyshack", "Fletch", "Days of Thunder", "Crazy Heart"),
  year=c(1988, 1980, 1985, 1990, 2009)
)
boxoffice <- data.frame(
  title=c("The Great Outdoors", "Caddyshack", "Fletch", "Days of Thunder","Top Gun"),
  revenue=c(43455230, 39846344, 59600000, 157920733, 353816701)
)
sqldf("SELECT
        m.*
        , b.revenue
      FROM
        movies m
      INNER JOIN
        boxoffice b
          ON m.title = b.title;")

install.packages("forecast")
library(forecast)
fit <- auto.arima(mdeaths)
head(mdeaths)
forecast(fit, level=c(80, 95, 99), h=3)
plot(forecast(fit), shadecols="oldstyle")

library(plyr)
ddply(iris, .(Species), summarise, mean_petal_length=mean(Petal.Length))
unlist(daply(iris[,4:5], .(Species), colwise(mean)))

install.packages("stringr")
library(stringr)
names(iris)
names(iris) <- str_replace_all(names(iris), "[.]", "_")
s <- c("Go to Heaven for the climate, Hell for the company.")
str_extract_all(s, "[H][a-z]+ ")

library(lubridate)
year("2012-12-12")
day("2012-12-12")
ymd("2012-12-12")

library(reshape2)
iris$id <- 1:nrow(iris)
iris.lng <- melt(iris, id=c("id", "Species"))
head(iris.lng)
iris.wide <- dcast(iris.lng, id + Species ~ variable)
head(iris.wide)

library(ggplot2)
p <- ggplot(aes(x=value, fill=Species), data=iris.lng)
p + geom_histogram() +
  facet_wrap(~variable, scales="free")

install.packages("randomForest")
library(randomForest)
# download Titanic Survivors data
data <- read.table("http://math.ucdenver.edu/RTutorial/titanic.txt", h=T, sep="\t")
# make survived into a yes/no
data$Survived <- as.factor(ifelse(data$Survived==1, "yes", "no"))                 

idx <- runif(nrow(data)) <= .75
data.train <- data[idx,]
data.test <- data[-idx,]
rf <- randomForest(Survived ~ PClass + Age + Sex, data=data.train, importance=TRUE, na.action=na.omit)
imp <- importance(rf)
o <- order(imp[,3], decreasing=T)
imp[o,]

table(data.test$Survived, predict(rf, data.test), dnn=list("actual", "predicted"))
