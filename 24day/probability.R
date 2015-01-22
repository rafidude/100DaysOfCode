# Load the data frame
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/dasi/kobe.RData"))

# Inspect your data
head(kobe)
tail(kobe)

# Print the variable names of the data frame.
names(kobe)

# Print the first 9 values of the 'basket' variable
kobe$basket[1:9]

# Assign Kobe's streak lengths:
kobe_streak = calc_streak(kobe$basket)

# Draw a barplot of the result:
barplot(table(kobe_streak))

# simulate coin toss
outcomes = c("heads", "tails")
sample(outcomes, size = 1, replace = TRUE)
# Run the simulation:
sim_fair_coin = sample(outcomes, size=100, replace=T)
# Print the object:
sim_fair_coin
# Compute the counts of heads and tails:
table(sim_fair_coin)

# Run the unfair coin simulation:
outcomes = c("heads", "tails")
sim_unfair_coin = sample(outcomes, replace=T, size=100, prob = c(0.2, 0.8))

# Print the object:
sim_unfair_coin

# Compute the counts of heads and tails:
table(sim_unfair_coin)

# Run the simulation for Kobe and assign the result to 'sim_basket'.
outcomes = c("H", "M")
sim_basket = sample(outcomes, replace=T, size=133, prob=c(0.45, 0.55))
table(sim_basket)

calc_streak <- function(x){
  y <- as.numeric(x == "H")
  y <- c(0, y, 0)
  wz <- which(y == 0)
  streak <- diff(wz) - 1
  return(streak)
}

# Calculate streak lengths:
kobe_streak = calc_streak(kobe$basket)
sim_streak = calc_streak(sim_basket)

# Compute summaries:
summary(kobe_streak)
summary(sim_streak)

# Make bar plots:
kobe_table = table(kobe_streak)
sim_table = table(sim_streak)
barplot(kobe_table)
barplot(sim_table)
