d2
class(d2)
summary(d2)
table(donors$ID)
BikeData
library(SDSFoundations)
animaldata <- AnimalData
animaldata[1:10,]
typeof(animaldata$Days.Shelter)
adopted = animaldata[animaldata$Outcome.Type == 'Adoption',]
hist(adopted$Days.Shelter)
fivenum(adopted$Days.Shelter)
median(adopted$Days.Shelter)
table(animaldata$Outcome.Type)
sd(adopted$Days.Shelter)
animaldata[animaldata$Days.Shelter == max(animaldata$Days.Shelter),]
mean(adopted$Days.Shelter)
sd(adopted$Days.Shelter)
fivenum(adopted$Days.Shelter)
table(animaldata$Animal.Type)
adultDogs = animaldata[animaldata$Age.Intake > 1 && ,]
animaldata$Age.Intake[animaldata$Animal.Type == 'Dog'] > 1
adultDogs = animaldata[animaldata$Age.Intake[animaldata$Animal.Type == 'Dog'] > 1,]
adultCats = animaldata[animaldata$Age.Intake[animaldata$Animal.Type == 'Cat'] > 1,]
adultDogs$Age.Intake
adultDogs = animaldata[animaldata$Age.Intake[animaldata$Animal.Type == 'Dog'] > 0,]
adultCats = animaldata[animaldata$Age.Intake[animaldata$Animal.Type == 'Cat'] > 0,]
adultDogs$Age.Intake
animaldata[animaldata$Age.Intake[] > 0]
cats = animaldata[animaldata$Animal.Type == 'Cat',]
table(cats)
adultcats = cats[cats$Age.Intake > 0,]
dogs = animaldata[animaldata$Animal.Type == 'Dog',]
adultdogs = dogs[dogs$Age.Intake > 0,]
hist(adultdogs$Weight)
hist(adultcats$Weight)
mean(adultcats$Weight)
sd(adultcats$Weight)
zcat = (13 - mean(adultcats$Weight))/sd(adultcats$Weight)
1.00 - pnorm(zcat)
8.6 + 1.9*3
median(adultdogs$Weight)
fivenum(adultdogs$Weight)
max(adultdogs$Weight)
median(adultcats$Weight)
8.6 - 1.9*2
table(dogs$Intake.Type)
summary(dogs$Intake.Type)
81/291
osdogs = dogs[dogs$Intake.Type == 'Owner Surrender',]
table(osdogs$Outcome.Type)
osdogs$Outcome.Type == 'Return to Owner'
ret = osdogs[osdogs$Outcome.Type == 'Return to Owner',]
6/0.15
t = c(2,     2,     3,     6,     7,     9,     13,     15,     18)
t
sum(t)
10*8 - 75
6.7-1.5*1.1
(6.5-4.5)/1.1
1 - pnorm(-1.81818)
cs = c('Weight', 'Max.Weight', 'Max.Life.Expectancy')
cor(dogs[,cs])
