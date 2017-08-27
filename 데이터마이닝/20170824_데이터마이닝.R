setwd('/Users/arnorfati/Documents/GitHub/SNU_BDI')
library(ISLR)
library(boot)
head(Auto)
attach(Auto)
mpg.fit <- lm(mpg~poly(horsepower,5))
pred.x<- data.frame(horsepower=seq(46,230,1))
mpg.pred=predict.lm(mpg.fit,newdata=pred.x,se.fit = T)

plot(seq(46,230,1),mpg.pred$fit,type='l',xlab='horespower',ylab='mpg')
smapid=sample(n,n,replace=T)

B = 1000
d = length(seq(46,230,1))
bootfit <- matrix(0,B,d)
bootsamp <- bootresid<- rep(0,n)

for (b in (1:B)) {
  sampid <- sample(n,n,replace = T)
  bmpg = ofit+oresid[sampid]
  bmpg.fit = lm(bmpg~ploy(horsepower,5))
  bmpg.pred <- predic.lm(bmpg)
  
}