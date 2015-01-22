help(DateTimeClasses)
t <- Sys.time()
print(t)
cat(t,"\n")
c <- as.POSIXlt(t)
names(c)

help(strftime)
t <- Sys.time()
cat(t,"\n")
timeStamp <-  strftime(t,"%Y-%m-%d %H:%M:%S")
timeStamp

myData <- data.frame(time=c("2014-01-23 14:28:21","2014-01-23 14:28:55",
                            "2014-01-23 14:29:02","2014-01-23 14:31:18"),
                     speed=c(2.0,2.2,3.4,5.5))
summary(myData)
myData

earlier <- strptime("2000-01-01 00:00:00","%Y-%m-%d %H:%M:%S")
later <- strptime("2000-01-01 01:00:00","%Y-%m-%d %H:%M:%S")
difftime(later,earlier)
difftime(later,earlier,units="secs")
