#1
dbinom(4, size = 10, prob = 0.4)

#2
y <- dbinom(0:10, size = 10, prob = 0.6)
plot(0:10, y, type="h", lwd=10, col="blue", xlab="성공확률X", ylab="확률", main="coin 이항분포")

#3
pbinom(2, size=10, prob=0.6, lower.tail= FALSE)

#4
plot(pbinom(0:10, size=10, prob=0.6), type='h', lwd=10, col="blue", main = "누적이항분포")

#5
plot(dpois(x=c(0:10), lambda = 2.5), type='h', lwd=10, col="red", xlab="성공확률X", main = "포아송분포")

#6
pexp(q=2.2/7, rate=2.2, lower.tail= TRUE) 

#7
r <- rnorm(100, mean = 0, sd = 1)
r <-sort(r) 
plot(r, dnorm(r, 0,1), type='l', main="정규분포, X~N(50,20)")
abline(v=100, col="blue", lty=3)
