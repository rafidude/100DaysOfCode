student.gpas = c(3.2, 3.5, 4.0, 3.8)
str(student.gpas)

is.numeric(student.gpas)
cmpl = c(1 + 2i, 5 + 7i)
cmpl
student.gpas[c(T,F,T)]
as.character(student.gpas)
gen <- factor(c("M", "M", "F", "F"))
str(gen)
as.numeric(gen)

st <- list(g = student.gpas, c = cmpl)
str(st)

st$c

