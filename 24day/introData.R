# Load the cdc data frame into the workspace:
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/dasi/cdc.Rdata"))
names(cdc)
head(cdc)
tail(cdc)
mean(cdc$weight)
var(cdc$weight)
median(cdc$weight)
summary(cdc$weight)
table(cdc$genhlth)
table(cdc$genhlth)/20000
barplot(table(cdc$smoke100))
table(cdc$gender)
gender_smokers = table(cdc$gender, cdc$smoke100)
gender_smokers
# Plot the mosaicplot:
mosaicplot(gender_smokers)
# Create the subsets:
first8 = cdc[1:8,3:5]
wt_gen_10_20 = cdc[10:20, 6:9]
# Create the subset:
under23_and_smoke = subset(cdc, cdc$age < 23 & cdc$smoke100 == 1)
subset(cdc, cdc$gender == "f" | cdc$age > 30)
boxplot(cdc$height)
summary(cdc$height)
# Draw the boxplot of the weights versus smoking:
boxplot(cdc$weight ~ cdc$smoke100)
# Calculate the BMI:
bmi = (cdc$weight/cdc$height^2)*703
# Draw the boxplot:
boxplot(bmi ~ cdc$genhlth)
hist(bmi)
# And one with breaks set to 50:
hist(bmi, breaks=50)
# And one with breaks set to 100:
hist(bmi, breaks=100)
plot(cdc$weight, cdc$wtdesire)
