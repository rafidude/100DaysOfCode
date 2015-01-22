a <- data.frame(one=c( 0, 1, 2),two=c("a","a","b"))
a
b <- data.frame(one=c(10,11,12),two=c("c","c","d"))
b
v <- rbind(a,b)
v
typeof(v)
w <- cbind(a,b)
w
names(w) = c("one","two","three","four")
w
w$three
A = matrix(c( 1, 2, 3, 4, 5, 6),ncol=3,byrow=TRUE)
typeof(A)
x <- list(a=rnorm(200,mean=1,sd=10),
          b=rexp(300,10.0),
          c=as.factor(c("a","b","b","b","c","c")))
lapply(x,summary)

x <- list(a=rnorm(8,mean=1,sd=10),b=rexp(10,10.0))
x
val <- lapply(x,mean)
typeof(val)
other <- sapply(x,mean)
typeof(other)

val <- data.frame(a=c(1,2,10,20,5,50), b=as.factor(c("a","a","b","b","a","b")))
val
result <- tapply(val$a,val$b,mean)
typeof(result)
result <- tapply(val$a,val$b,summary)
typeof(result)
result
