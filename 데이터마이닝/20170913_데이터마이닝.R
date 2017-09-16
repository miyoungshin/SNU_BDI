set.seed(3)
x <- matrix(rnorm(20*2),ncol=2)
y =c(rep(-1,10),rep(1,10))
x [y==1] = x[y==1,]+1

plot(x,col=(3-y))
plot(x)

install.packages('e1071')
library(e1071)
dat <- data.frame(y=x,y=as.factor(y))
str(dat)
svm.fit = svm(y~., data=dat, kernel='linear',cost=10,scale = FALSE)
plot(svmfit,dat)


svm.fit = svm(y~., data=dat, kernel='linear', cost=0.1 ,scale = FALSE)
plot(svm.fit,dat)
set.seed(1)
tune.out=tune(svm,y~.,data=dat,kernel='linear',ranges=list(cost=c(0.001,0.01,0.1,1.5,10)))

bestmod <- tune.out$best.model
summary(bestmod)
