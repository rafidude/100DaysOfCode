library(zoo)

VBLTX_prices = get.hist.quote(instrument="vbltx", start="2005-09-01", end="2010-09-30", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo", quiet = TRUE)
FMAGX_prices = get.hist.quote(instrument="fmagx", start="2005-09-01", end="2010-09-30", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo", quiet = TRUE)
SBUX_prices = get.hist.quote(instrument="sbux", start="2005-09-01",end="2010-09-30", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo", quiet = TRUE)
head(VBLTX_prices)
# Change the class of the time index to yearmon, which is appropriate for monthly data.
# index() and as.yearmon() are functions in the zoo package 
index(VBLTX_prices) = as.yearmon(index(VBLTX_prices))
index(FMAGX_prices) = as.yearmon(index(FMAGX_prices))
index(SBUX_prices) = as.yearmon(index(SBUX_prices))
head(VBLTX_prices)

all_prices = merge(VBLTX_prices, FMAGX_prices, SBUX_prices)
head(all_prices)
colnames(all_prices) = c("VBLTX", "FMAGX", "SBUX")

all_returns = diff(log(all_prices))
head(all_returns)
return_matrix = coredata(all_returns)
head(return_matrix)

# Number of observations
n_obs = dim(return_matrix)[1]

# Estimates of sigma2hat
sigma2hat_vals = apply(return_matrix, 2, var)

# Standard Error of sigma2hat
se_sigma2hat = sigma2hat_vals/sqrt(n_obs/2)

# Calculate the correlation matrix
cor_matrix = cor(return_matrix)

# Get the lower triangular part of that 'cor_matrix'
rhohat_vals = cor_matrix[lower.tri(cor_matrix)]

# Set the names
names(rhohat_vals) <- c("VBLTX,FMAGX","VBLTX,SBUX","FMAGX,SBUX")

# Compute the estimated standard errors for correlation
se_rhohat = (1-rhohat_vals^2)/sqrt(dim(return_matrix)[1])

t.test(all_returns[, "VBLTX"])
?cor.test
cor.test(all_returns[, "VBLTX"], all_returns[, "FMAGX"])
cor.test(all_returns[, "VBLTX"], all_returns[, "SBUX"])
jarque.bera.test(all_returns[,"VBLTX"])

library("boot")
# Function for bootstrapping sample mean: 
mean_boot = function(x, idx) {
  ans = mean(x[idx])
  ans 
} 
# Construct VBLTX_mean_boot:
VBLTX_mean_boot = boot(return_matrix[,"VBLTX"], statistic = mean_boot, R=999)
# Print the class of VBLTX_mean_boot
class(VBLTX_mean_boot)

# Print VBLTX_mean_boot
VBLTX_mean_boot

# Plot bootstrap distribution and qq-plot against normal
plot(VBLTX_mean_boot)

# Annual risk-free rate of 3% per year for the T-bill
t_bill_rate = 0.03

# Ratio Boeing stocks
boeing_weights = seq(from=-1, to=2, by=0.1)

# Portfolio parameters
mu_portfolio_boeing_bill = t_bill_rate + boeing_weights*(mu_boeing - t_bill_rate)
sigma_portfolio_boeing_bill = boeing_weights*sigma_boeing

# Plot previous exercise
plot(sigma_portfolio, mu_portfolio, type="b", pch=16, ylim=c(0, max(mu_portfolio)), xlim=c(0, max(sigma_portfolio)), xlab=expression(sigma[p]), ylab=expression(mu[p]),col=c(rep("green", 18), rep("red", 13)))
text(x=sigma_boeing, y=mu_boeing, labels="Boeing", pos=4)
text(x=sigma_msft, y=mu_msft, labels="MSFT", pos=4)

# Portfolio Combination Boeing and T-bills
points(sigma_portfolio_boeing_bill, mu_portfolio_boeing_bill, type="b", col="blue")

# Sharp ratio Boeing
sharp_ratio_boeing = (mu_boeing - t_bill_rate)/sigma_boeing

global_min_var_portfolio = globalMin.portfolio(mu_hat_annual,cov_mat_annual)
global_min_var_portfolio

# Summary of global_min_var_portfolio that takes into account the annual risk-free rate of 3% per year
summary(global_min_var_portfolio, risk.free=0.03)

# Portfolio weights Boeing and Microsoft
plot(global_min_var_portfolio)

# Plot previous exercises
plot(sigma_portfolio, mu_portfolio, type="b", pch=16, ylim=c(0, max(mu_portfolio)), xlim=c(0, max(sigma_portfolio)), xlab=expression(sigma[p]), ylab=expression(mu[p]),col=c(rep("green", 18), rep("red", 13)))
text(x=sigma_boeing, y=mu_boeing, labels="Boeing", pos=4)
text(x=sigma_msft, y=mu_msft, labels="MSFT", pos=4)

# Plot the position of the global minimum variance portfolio
text(x=global_min_var_portfolio$sd, y=global_min_var_portfolio$er, labels="Global min", pos=2)
