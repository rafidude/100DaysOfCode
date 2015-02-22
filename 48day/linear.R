library(UsingR)
str(father.son)
mean(father.son$sheight)
father.son[round(father.son$fheight) == 71,]
mean(father.son[round(father.son$fheight) == 71,]$sheight)

X = matrix(1:1000,100,10)
X[25,3]
x=1:10
m1 <- cbind(x, 2*x, 3*x, 4*x, 5*x)
sum(m1[7,])
matrix(1:60,20,3, byrow=T)
t(m1)
d1 <- diag(5)
solve(d1)
matrix(1,4)
m2 <- cbind(c(3,2,1,5), c(4,2,-1,0), c(-5,2,5,0), c(1, -1, -5,1))
r1 <- c(10,5,7,4)
solve(m2) %*% r1

x <- father.son$fheight
y <- father.son$sheight
X <- cbind(1, x)
betahat <- solve(t(X) %*% X) %*% t(X) %*% y

a <- matrix(1:12, nrow=4)
b <- matrix(1:15, nrow=3)

a %*% b
sum(a[3,] * b[,2])

betah <- solve(crossprod(X)) %*% crossprod(X, y)

QR <- qr(X)
Q <- qr.Q(QR)
R <- qr.R(QR)
backsolve(R, crossprod(Q,y))

