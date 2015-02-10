# X ~ N(0.05, (0.10)^2)
mu_x = 0.05
sigma_x = 0.10
x = seq(-3, 3, 0.1)
y = pnorm(x)
plot(x, y)
# Pr(X > 0.10)
1 - pnorm(0.10, mean = mu_x, sd = sigma_x)
# Pr(X < -0.10)
pnorm(-0.10, mean = mu_x, sd = sigma_x)
# Pr(-0.05 < X < 0.15)
pnorm(0.15, mean = mu_x, sd = sigma_x) - pnorm(-0.05, mean = mu_x, sd = sigma_x)

# 1%, 5%, 95% and 99% quantile
qnorm(c(0.01, 0.05, 0.95, 0.99), mean = mu_x, sd = sigma_x)

# Normally distributed monthly returns
x_vals = seq(-0.25, 0.35, length.out = 100)
MSFT = dnorm(x_vals, mean= 0.05, sd=0.1)
SBUX = dnorm(x_vals, mean= 0.025, sd=0.05)

# Add a normal curve for MSFT
plot(x_vals, MSFT, type = "l", col = "blue", ylab = "Normal curves", ylim = c(0, 8))
# Add a normal curve for SBUX
lines(x_vals, SBUX, type = "l", col = "red", ylab = "Normal curves", ylim = c(0, 8))
# Add a plot legend
legend("topleft", legend = c("Microsoft", "Starbucks"), col = c("blue", "red"), lty = 1)

# MSFT stock simple return quantile
# R ~ N(0.04, (0.09)^2) 
mu_R = 0.04
sigma_R = 0.09
# Initial wealth $100,000
W0 = 100000
# 1% value-at-risk
W0 * qnorm(0.01, mean = mu_R, sd = sigma_R)
# 5% value-at-risk
W0 * qnorm(0.05, mean = mu_R, sd = sigma_R)
# MSFT continuously compounded return quantile
# 1% value-at-risk
W0 * (exp(qnorm(0.01, mean = mu_R, sd = sigma_R)) - 1)
# 5% value-at-risk
W0 * (exp(qnorm(0.05, mean = mu_R, sd = sigma_R)) - 1)

# Vectors of prices Amazon (RA) and Costco (RC)
PA = c(38.23, 41.29)
PC = c(41.11, 41.74)
# Simple monthly returns
RA = (PA[2] - PA[1])/PA[1]
RC = (PC[2] - PC[1])/PC[1]
# Continuously compounded returns
rA = log(PA[2]) - log(PA[1])
rC = log(PC[2]) - log(PC[1])

# Cash dividend per share
DA = 0.1
# Simple total return
RA_total = (PA[2] + DA - PA[1])/PA[1]
# Dividend yield
DY = DA/PA[1]

# Simple annual return
RA_annual = (1 + RA)^12 - 1
# Continuously compounded annual return
rA_annual = log(1 + RA_annual)

# Portfolio shares
xA = 8000/10000
xC = 2000/10000

# Simple monthly return
xA*RA + xC*RC
