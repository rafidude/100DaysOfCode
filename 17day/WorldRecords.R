library("SDSFoundations", lib.loc="/Applications/RStudio.app/Contents/Resources/R/library")
WR <- WorldRecords
str(WR)
table(WR$Event)
unique(WR$Event)
WR$Athlete == "Usain Bolt"
ub = WR[WR$Athlete == "Usain Bolt",]
ub
table(WR$Year)

menshot <- WR[WR$Event=='Mens Shotput',]
womenshot <- WR[WR$Event=='Womens Shotput',] 
plot(menshot$Year,menshot$Record,main='Mens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenshot$Year,womenshot$Record,main='Womens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
linFit(menshot$Year, menshot$Record)
linFit(womenshot$Year,womenshot$Record)

menmile = WR[WR$Event=='Mens Mile',]
womenmile = WR[WR$Event=='Womens Mile',]
plot(menmile$Year,menmile$Record,main='Mens Mile World Records',xlab='Year',ylab='World Record Time (s)',pch=16)
plot(womenmile$Year,womenmile$Record,main='Womens Mile World Records',xlab='Year',ylab='World Record Time (s)',pch=16)
linFit(menmile$Year, menmile$Record)
linFit(womenmile$Year, womenmile$Record)


