library(PerformanceAnalytics);library(zoo);library(tseries);

VBLTX_prices = get.hist.quote(instrument="vbltx", start="1998-01-01",end="2009-12-31", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo", quiet=TRUE)
FMAGX_prices = get.hist.quote(instrument="fmagx", start="1998-01-01",end="2009-12-31", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo", quiet=TRUE)
SBUX_prices = get.hist.quote(instrument="sbux", start="1998-01-01",end="2009-12-31", quote="AdjClose",provider="yahoo", origin="1970-01-01",compression="m", retclass="zoo", quiet=TRUE)

all_prices = merge(VBLTX_prices, FMAGX_prices, SBUX_prices)
# Rename columns
colnames(all_prices) = c("VBLTX", "FMAGX", "SBUX")

# Calculate cc returns as difference in log prices
all_returns = diff(log(all_prices))

# Look at the return data
start(all_returns)
end(all_returns)
colnames(all_returns) 
head(all_returns)
# Plot returns using the PerformanceAnalytics function chart.TimeSeries().
# This function creates a slightly nicer looking plot than plot.zoo()
chart.TimeSeries(all_returns, legend.loc="bottom", main=" ") 

# The previous charts are a bit hard to read. The PerformanceAnalytics function
# chart.Bar makes it easier to compare the returns of different assets on the 
# same plot
chart.Bar(all_returns, legend.loc="bottom", main=" ")


# Cumulative return plot - must use simple returns (!) and not cc returns for this
# Use PerformanceAnalytics function chart.CumReturns()
simple_returns = diff(all_prices)/lag(all_prices, k=-1);
chart.CumReturns(simple_returns, legend.loc="topleft", wealth.index=TRUE,main="Future Value of $1 invested")

# Create matrix with returns
return_matrix = coredata(all_returns);

# Generate four panel plots
par(mfrow=c(2,2))
hist(return_matrix[,"VBLTX"],main="VBLTX monthly returns",
     xlab="VBLTX", probability=T, col="slateblue1")
boxplot(return_matrix[,"VBLTX"],outchar=T, main="Boxplot", col="slateblue1")
plot(density(return_matrix[,"VBLTX"]),type="l", main="Smoothed density",
     xlab="monthly return", ylab="density estimate", col="slateblue1")
qqnorm(return_matrix[,"VBLTX"], col="slateblue1")
qqline(return_matrix[,"VBLTX"])
par(mfrow=c(1,1))

summary(return_matrix)
args(apply)
apply(return_matrix, 2, mean)
apply(return_matrix, 2, var)
apply(return_matrix, 2, sd)

# Annualized continuously compounded mean 
12*apply(return_matrix, 2, mean);
# Annualized simple mean
exp(12*apply(return_matrix, 2, mean)) - 1;
# Annualized standard deviation values
sqrt(12)*apply(return_matrix, 2, sd);

# Display all possible pair-wise scatter plots
pairs(return_matrix, pch=16, col="slateblue1")
# Compute 3 x 3 covariance and correlation matrices
var(return_matrix)
cor(return_matrix)
