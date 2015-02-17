A <- matrix(1:4, nrow=2)
t(A)
AInverse <- solve(A)
AInverse %*% A

B <- matrix(2:5, nrow=2)
C <- A * B # element wise multiplication
D <- A %*% B # matrix multiplication

library(quantmod)
getSymbols(c("C", "^GSPC"))
citi <- c(coredata(monthlyReturn(C["2010"])))
sp500 <- c(coredata(monthlyReturn(GSPC["2010"])))

X <- cbind(1, sp500)
qrX <- qr(X)
Q <- qr.Q(qrX, complete = TRUE)
R <- qr.R(qrX, complete = TRUE)

u <- t(Q) %*% citi
backsolve(R[1:2, 1:2], u[1:2])

coef(lsfit(sp500, citi))
