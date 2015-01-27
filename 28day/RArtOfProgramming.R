mean(abs(rnorm(100)))
hist(rnorm(100))
data()
mean(Nile)
head(Nile)
hist(Nile)

oddCount = function(x){
  count = 0
  for (i in x){
    if (i%%2 == 1){
      count = count + 1
    }
  }
  return(count)
}

x = c(1,2,3,4,5)
oddCount(x)

m = rbind(c(1,4), c(2,2))
m
m %*% c(1,1)
hn = hist(Nile)
str(hn)
d <- data.frame(list(kids=c("Jack","Jill"),ages=c(12,10)))
d

x = c(1,2,4)
x*c(1,0,5)
z <- c(5,12,13)
z[-length(z)]

x <- c(88,NULL,12,168,13)
mean(x)
x <- c(88,0,12,168,13)
mean(x)

z = NULL
z = c(z, 1)
z

y <- matrix(c(1,2,3,4),nrow=2,ncol=2)
y
m <- matrix(c(1,2,3,4,5,6),nrow=2,byrow=T)
m
y %*% y
x <- matrix(nrow=3,ncol=3)
x
x[2:3,2:3] <- y
x
