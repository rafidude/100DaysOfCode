help(Control)
help(source)
pwd = getwd()
pwd = paste(pwd, "/23day", sep="")
setwd(pwd)
source('simple.R')
dir()

x = 2.0
if ( x < 0.2)
{
  x <- x + 1
  cat("increment that number!\n")
} else
{
  x <- x - 1
  cat("nah, make it smaller.\n");
}

for (lupe in seq(0,1,by=0.3))
{
  print(lupe)
}

x <- c(1,2,4,8,16)
for (i in x) {
  print(i)
}

x <- rnorm(5)
for(lupe in x)
{
  if (lupe > 2.0)
    next
  
  if( (lupe<0.6) && (lupe > 0.5))
    break
  
  cat("The value of lupe is ",lupe,"\n");
}

newDef <- function(a,b)
{
  x = runif(10,a,b)
  mean(x)
}
newDef(-1,1)
