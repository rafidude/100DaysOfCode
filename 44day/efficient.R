# All data and CER parameters are preloaded in your workspace.  Type 'ls()' in the console to see them.

# Load the relevant packages
library("zoo")

# Load the working environment
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/compfin/lab9.RData"))

# Explore the data set
head(returns_df)

# Timeplots with stocks on individual graphs
my.panel <- function(...) {
  lines(...)
  abline(h=0)
}
plot(returns_df, lwd=2, panel=my.panel, col="blue")

# Timeplots with stocks on same graph
plot(returns_df, plot.type = "single", main="Returns", col=1:4, lwd=2)
abline(h=0)
legend(x="bottomleft", legend=colnames(returns_df), col=1:4, lwd=2)

# Parameters CER model
mu_hat_month = apply(returns_df, 2, mean)
mu_hat_month
sigma2_month = apply(returns_df, 2, var)
sigma2_month
sigma_month = apply(returns_df, 2, sd)
sigma_month
cov_mat_month = var(returns_df)
cov_mat_month
cor_mat_month = cor(returns_df)
cor_mat_month
# Pairwise scatterplots
pairs(coredata(returns_df), col="blue", pch=16)

# Calculate the global minimum variance portfolio
global_min_var_portfolio = globalMin.portfolio(mu_hat_month, cov_mat_month,shorts=TRUE)
global_min_var_portfolio
# Plot the portfolio weights of our four stocks
plot(global_min_var_portfolio)

# global minimum variance portfolio short sales are not allowed
# set restriction matrices
D_matrix = 2* cov_mat_month
D_matrix
d_vector = rep(0,4)
d_vector
A_matrix = cbind(rep(1,4),diag(4))
A_matrix
b_vector = c(1,rep(0,4))
b_vector
library("quadprog")
# use solve.QP to minimize portfolio variance
quad_prog = solve.QP(Dmat = D_matrix,dvec = d_vector, Amat = A_matrix, bvec = b_vector, meq = 1) 
quad_prog
# The global minimum variance portfolio short sales NOT allowed
global_min_var_portfolio  = globalMin.portfolio(mu_hat_month, cov_mat_month, shorts=F)
global_min_var_portfolio 

# efficient portfolio
# highest average return
mu_target = max(mu_hat_month)

# short sales allowed
efficient_porfolio_short = efficient.portfolio(mu_hat_month, cov_mat_month, mu_target,shorts=TRUE)
efficient_porfolio_short
plot(efficient_porfolio_short)

# no short sales allowed
efficient_porfolio_no_short = efficient.portfolio(mu_hat_month, cov_mat_month, mu_target,shorts=FALSE)
efficient_porfolio_no_short
plot(efficient_porfolio_no_short)

# The efficient frontier of risky assets 
efficient_frontier = efficient.frontier(mu_hat_month, cov_mat_month, alpha.min=-1, alpha.max=1)
summary(efficient_frontier)

# The plot
plot(efficient_frontier, plot.assets=TRUE, col="blue", lwd=2)  

# risk free rate
t_bill_rate = 0.005

# Tangency portfolio short sales allowed
tangency_portfolio_short = tangency.portfolio(mu_hat_month, cov_mat_month, risk.free=t_bill_rate,shorts=TRUE)
summary(tangency_portfolio_short)
#plot
plot(tangency_portfolio_short)

# Tangency portfolio short sales not allowed
tangency_portfolio_no_short = tangency.portfolio(mu_hat_month, cov_mat_month, risk.free=t_bill_rate,shorts=FALSE)
summary(tangency_portfolio_no_short)
#plot
plot(tangency_portfolio_no_short)
