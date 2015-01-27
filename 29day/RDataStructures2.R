names <- c("Raj", "Rahul", "Priya", "Poonam")
grades <- c(3.4, 4.0, 3.6, 3.1)
st <- data.frame(names, grades)
typeof(st)
str(st)

st[1]
typeof(st[1])
st[[1]]
typeof(st[[1]])

m <- cbind(names, grades)
rownames(m) <- c('a', 'b','c','d')
str(m)
