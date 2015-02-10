initial = 100000
interest = 0.08 # 8%
periods = 10 # years
simple = (1 + interest*periods)*initial

# compound interest
compound = ((1 + interest)^periods)*initial

# Annuity
AnnuityK <- function(amount, interest, period) amount/(1 + interest)^period
AnnuityK(100, 0.04, 3)
sum <- 0
for (n in 1:10){
  sum <- sum + AnnuityK(100, 0.04, n)
  print(sum)
}
sum
# formula for calculating the present value of an annuity
Annuity <- function(amount, interest, period) (amount/interest)*(1 - 1/(1 + interest)^period)
Annuity(100, 0.04, 10) 
Annuity(1000, 0.03, 1000) - Annuity(1000, 0.03, 15)

# perpetual annuities
amount = 1000; interest = 0.03
# perpetual P V 
amount/interest

# Bond pricing
faceValue <- 1000
rate <- 0.05
coupon <- 100
periods <- 20
bondPresentValue <- function(faceValue, rate, coupon, periods) faceValue/(1 + rate)^periods + coupon/rate*(1 - (1/((1 + rate)^periods)))
bondPresentValue(faceValue, rate, coupon, periods)
