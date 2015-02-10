# Simple vs Compounded Returns
data_url = "http://assets.datacamp.com/course/compfin/sbuxPrices.csv"
sbux_df  = read.csv(file=data_url, header=TRUE, stringsAsFactors=FALSE)

str(sbux_df)
head(sbux_df)
tail(sbux_df)
class(sbux_df$Date)

closing_prices = sbux_df[,2, drop=FALSE]
str(closing_prices)
head(closing_prices)

index_1 = which(sbux_df$Date=="3/1/1994")
index_2 = which(sbux_df$Date=="3/1/1995")
some_prices = sbux_df$Adj.Close[index_1:index_2]

sbux_prices_df = sbux_df[, "Adj.Close", drop=FALSE]
rownames(sbux_prices_df) = sbux_df$Date
head(sbux_prices_df)
price_1 = sbux_prices_df["3/1/1994", 1]
price_2 = sbux_prices_df["3/1/1995", 1]

plot(sbux_df$Adj.Close, type="l", col="blue", lwd=2, ylab="Adjusted close", main="Monthly closing price of SBUX")
n = nrow(sbux_prices_df)
sbux_ret = (sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n-1), 1])/sbux_prices_df[1:(n-1), 1]
class(sbux_ret)
names(sbux_ret) = sbux_df[2:n,1]
head(sbux_ret)

sbux_ccret = log(sbux_prices_df[2:n,1]) - log(sbux_prices_df[1:(n-1),1])
names(sbux_ccret) = sbux_df[2:n,1]
head(sbux_ccret)

head(cbind(sbux_ret, sbux_ccret))

plot(sbux_ret, type="l", col="blue", lwd=2, ylab="Return", main="Monthly Returns on SBUX")
abline(h=0)
legend(x="bottomright", legend=c("Simple", "CC"), lty=1, lwd=2, col=c("blue","red"))
lines(sbux_ccret, type="l", col="red", lwd=2, ylab="CC Return", main="Monthly CC Returns on SBUX")

sbux_gret = (1 + sbux_ret)
sbux_fv = cumprod(1 + sbux_ret)
plot(sbux_fv, type="l", col="blue", lwd=2, ylab="Dollars", main="FV of $1 invested in SBUX")

t1 = sbux_ccret['12/1/1994']
t2 = sbux_ccret['12/1/1995']

