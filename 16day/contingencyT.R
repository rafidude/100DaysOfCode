acl = AustinCityLimits
table(acl[1:10,]$Grammy)
fem = acl[acl$Gender == 'F',]
fem60p = fem[fem$Age > 60,]
mal = acl[acl$Gender == 'M',]


table(acl$Gender)
table(acl$Genre)
two = table(acl$Genre, acl$Gender)
barplot(two, legend=T, beside=T)
propTwo = prop.table(two)
barplot(propTwo, legend=T, beside=T)

genderGenre = table(acl$Gender, acl$Genre)
pGenderGenre = prop.table(genderGenre)
pGenderGenre
barplot(pGenderGenre, legend=T, beside=T)

class(genderGenre)
