mean <- 10.0
sd <- 20.0

beg.balance <- 550000
years.retirement <- 25
inflation <- 2.5/100
withdrawal <- 20000
simulations <- 1000
k <- 0
pr <- rep(NA, 11)
withdrawals <- seq(withdrawal - 5000, withdrawal + 5000, 1000)
for (wd in withdrawals){
  ending.balance <- rep(NA, simulations)
  
  for (j in 1:simulations) {
    bal <- beg.balance 
    norm <- rnorm(years.retirement)

    for (i in 1:years.retirement) {
      ret <- (mean + norm[i] * sd)/100
      bal <- bal*(1 + ret) - wd*((1 + inflation)**i)
    }
    ending.balance[j] <- bal
  }
  
  k = k + 1
  pr[k] = length(ending.balance[ending.balance > 0])/1000
}

df = data.frame(wds = withdrawals, probs = pr)
plot(df$wds, df$probs)