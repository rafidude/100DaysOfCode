acl = AustinCityLimits
str(acl)
grammy = table(acl$Grammy)
table(acl$Genre)
gr = table(acl$Grammy, acl$Genre)
barplot(gr, beside=T, legend=T)
prop.table(grammy)
prop.table(gr,2)
gr
winners = acl[acl$Grammy == 'Y',]
prop.table(table(winners$Genre))
gr
