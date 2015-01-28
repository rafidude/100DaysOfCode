int <- c(-1L, 2L, 4L)
int
typeof(int)

text <- c("Hello", "World") 
text
typeof(text)

logic <- c(TRUE, FALSE, TRUE)
logic
typeof(logic)

comp<-c(1+1i,1+2i,1+3i) 
comp
typeof(comp)

raw(3)
typeof(raw(3))

die <- 1:6
attributes(die)
names(die) <- c("one", "two", "three", "four", "five", "six")
die
attributes(die)

dim(die) <- c(2, 3) 
die
dim(die) <- c(3, 2) 
die
dim(die) <- c(1, 2, 3) 
die

m <- matrix(die, nrow = 2)
m
m <- matrix(die, nrow = 2, byrow = TRUE) 
m

ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3)) 
ar

hand2 <- c("ace", "spades", "king", "spades", "queen", "spades", "jack",
           "spades", "ten", "spades")
matrix(hand2, nrow = 5, byrow = TRUE) 
matrix(hand2, ncol = 2, byrow = TRUE)

die <- c(1:6)
dim(die) <- c(2, 3) 
typeof(die)
class(die)
attributes(die)

now <- Sys.time()
now
typeof(now)
class(now)
unclass(now)

gender <- factor(c("male", "female", "female", "male"))
typeof(gender)
unclass(gender)
gender
as.character(gender)

df <- data.frame(face = c("ace", "two", "six"),
                 suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3))
df
typeof(df)
class(df)
str(df)

df <- data.frame(face = c("ace", "two", "six"),
suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3), stringsAsFactors = FALSE)
df

deck <- data.frame(
  face = c("king", "queen", "jack", "ten", "nine", "eight", "seven", "six",
           "five", "four", "three", "two", "ace", "king", "queen", "jack", "ten",
           "nine", "eight", "seven", "six", "five", "four", "three", "two", "ace",
           "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five",
           "four", "three", "two", "ace", "king", "queen", "jack", "ten", "nine",
           "eight", "seven", "six", "five", "four", "three", "two", "ace"),
  suit = c("spades", "spades", "spades", "spades", "spades", "spades",
           "spades", "spades", "spades", "spades", "spades", "spades", "spades",
           "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs",
           "clubs", "clubs", "clubs", "clubs", "clubs", "diamonds", "diamonds",
           "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "diamonds",
           "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "hearts",
           "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", "hearts",
           "hearts", "hearts", "hearts", "hearts", "hearts"),
  value=c(13,12,11,10,9,8,7,6,5,4,3,2,1,13,12,11,10,9,8, 7,6,5,4,3,2,1,13,12,11,10,9,8,7,6,5,4,3,2,1,13,12,11, 10,9,8,7,6,5,4,3,2,1)
)
deck
deck <- read.csv("deck.csv", stringsAsFactors=FALSE)
head(deck)
setwd("~/gocode/src/github.com/rafidude/100DaysOfCode/30day/")
write.csv(deck, file = "cards.csv", row.names = FALSE)
