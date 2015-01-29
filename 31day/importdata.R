getwd()
setwd("/Users/agilesense/gocode/src/github.com/rafidude/100DaysOfCode/31day")

na <- read.table("sample.txt", header=T, skip=1, sep=";", colClasses=c("character", "integer"))
na

install.packages("XLConnect")
library(XLConnect)
tt <- readWorksheetFromFile("100d.xlsx", sheet=1)
str(tt)
d100 = tt[1:5,c(1,2,6)]
str(d100)

help(package="foreign")

library(datasets)
data(package="datasets")

data(iris)
str(iris)
