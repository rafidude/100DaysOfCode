?read.csv
f = file.choose()
f = "/Users/agilesense/gocode/src/github.com/rafidude/100DaysOfCode/21day/simple.csv"
hei = read.csv(f, header=TRUE)
summary(hei)
dir()
getwd()
f = "/Users/agilesense/gocode/src/github.com/rafidude/100DaysOfCode/21day/trees91.csv"
tree = read.csv(f, header=TRUE)
attributes(tree)
ls()
a <- c(1,2,3,4,5)
occur <- matrix(c(4,3,2),ncol=3,byrow=TRUE)
occur
tree$LFBM
fivenum(tree$LFBM)
a = c(2,4,6,3,1,5)
b = sort(a)
c=sort(a, decreasing=TRUE)
