dat <- c(10, 7, 12, 9, 11, 6)
dim(dat) <- c(3, 2)
dat
rownames(dat) <- c("A1", "A2", "A3")
colnames(dat) <- c("B1", "B2")
barplot(dat, beside=TRUE)
barplot(t(dat), beside=TRUE)
dat <- t(dat)
plot(dat[1,], type='l')
lines(dat[2,], type='l', col='blue')

library(ggplot2)
dat <- data.frame(xval=1:4, yval=c(3,5,6,9), group=c("A","B","A","B"))
dat
p <- ggplot(dat, aes(x=xval, y=yval))
p + geom_point()
p + geom_point(aes(colour=group))
p + geom_point(colour="blue")
