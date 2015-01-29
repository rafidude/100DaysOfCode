RunMonteCarloSimulations = function(portfolio.mean = 10.0, portfolio.sd = 20.0, 
                                    beg.balance = 550000, years.retirement = 25, 
                                    inflation = 2.5, withdrawal = 20000, 
                                    simulations = 1000){
  ending.balance <- rep(NA, simulations)
  for (j in 1:simulations) {
    bal <- beg.balance 
    norm <- rnorm(years.retirement)
    
    for (i in 1:years.retirement) {
      ret <- (portfolio.mean + norm[i] * portfolio.sd)/100
      bal <- bal*(1 + ret) - wd*((1 + inflation/100)**i)
    }
    ending.balance[j] <- bal
  }
  prob <- length(ending.balance[ending.balance > 0])/1000
  prob
}

WithdrawalProbabilities = function(withdrawal.start=15000, withdrawal.end=25000, withdrawal.increment=1000){
  k <- 0
  withdrawals <- seq(withdrawal.start, withdrawal.end, withdrawal.increment)
  pr <- rep(NA, length(withdrawals))
  for (wd in withdrawals){
    prob <- RunMonteCarloSimulations(withdrawal = wd)
    k <- k + 1
    pr[k] <- prob
  }
  df <- data.frame(wds = withdrawals, probs = pr)
  print(df)
  plot(df$wds, df$probs)
}

WithdrawalProbabilities()

