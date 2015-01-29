Sum1 <- function(a, b){
  print(a)
  s <- a + b
  s
}
Sum2 <- function(a, b = 0){
  print(a)  
  a + b
}

Sum1(b = 3, a = 4)
Sum2(a=6)

#extra arguments ellipsis ...

# Lazy evaluation
tot <- function(a, b, c = avg){
  avg = (a + b)/2
  a + b + c
}

tot(2, 4)

totavg <- function(a, b){
  tot <- a + b
  avg <- (a + b)/2
  return (list(total = tot, average = avg))
}

totavg(2, 4)

totavg
formals(totavg)
body(totavg)

do.call(totavg, list(3,4))
