BikeData[BikeData$cyc_freq == "Daily",][1:10,]
typeof(BikeData$student)
table(BikeData$student)
student = BikeData[BikeData$student==1,]
student
table(student$cyc_freq)
distance = student$distance
distance
mean(distance)
BikeData
head(BikeData)
tail(BikeData)
table(BikeData$gender)
plot(BikeData$gender)
plot(BikeData$gender, main="Gender Barchart", xlab="Gender", ylab="Frequency")
hist(BikeData$age)
males = BikeData[BikeData$gender=='M',]
females = BikeData[BikeData$gender=='F',]
hist(males$age, breaks=20)
hist(females$age)
min(males$age)
which(males$age>50)
males[which(males$age>50),]
mean(males$age)
mean(females$age)
median(females$age)
median(males$age)
sd(males$age)
sd(females$age)
fivenum(males$age)
