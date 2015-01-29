testf <- function(temp){
  if (temp > 90) {
    print(paste("Temperature is ", temp, "Its hot!"))
  } else if (temp > 65){
    print(paste("Temperature is ", temp, "Its pleasant!"))
  } else {
    print(paste("Temperature is ", temp, "Its cold!"))
  }
}

testf(95)
testf(75)
testf(55)

scores <- c(76, 80, 59, 65, NA, 78)
ifelse(scores > 75, "Good", "OK")
ifelse(scores > 75, c("Good", "Wallah"), c("OK", "Hmm"))
count <- 0
repeat {
  count <- count + 1
  print(paste("Loop: ", count))
  if (count >= 1000) break
}

while (count < 2000){
  print(count)
  count <- count + 1
}

for (count in 88:99){
  print(count)
  count <- count + 1
}

m <- matrix(1:9, ncol=3)
m
apply(m, 1, sum)
apply(m, 2, sum)
apply(m, 1, max)
apply(m, 1:2, function(x) x + 3)

packages <- installed.packages()

search()

install.packages("devtools")
library(devtools)
install_github("ramnathv/slidify")
