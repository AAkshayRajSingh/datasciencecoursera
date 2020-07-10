x <- c(4, "a", TRUE)
class(x)
x <- c(1,3, 5) 
y <- c(3, 2, 10)
rbind(x, y)
x <- list(2, "a", "b", TRUE)
class(x[[1]]) 

x <- c(3, 5, 1, 10, 12, 6)
x[x<=5]<-0
x <- 1:4
y <- 2:3
class(x + y)
x <- c(4, TRUE)
class(x)