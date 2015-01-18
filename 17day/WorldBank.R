library(SDSFoundations)
world = WorldBankData
unique(world$Country)
denmark = world[world$Country == 'Denmark',]
belarus = world[world$Country == 'Belarus',]
den90 = denmark[denmark$year >=1990,]
bel90 = belarus[belarus$year >=1990,]
den90$prop = den90$internet.users/den90$population
bel90$prop = bel90$internet.users/bel90$population
den90$time = den90$year - 1990
bel90$time = bel90$year - 1990

expFit(den90$year, den90$prop)
logisticFit(den90$year, den90$prop)

expFit(bel90$year, bel90$prop)
logisticFit(bel90$year, bel90$prop)

