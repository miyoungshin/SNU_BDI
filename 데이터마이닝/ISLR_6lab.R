# 강의    교재 : introduce to statistical learning
# chapter 4 Lab: 선형모델 선택 및 정규화 / p.281
#-------------------------------------------------
setwd("C:/Users/User/Documents/GitHub/SNU_BDI/데이터마이닝")
setwd("/Users/arnorfati/Documents/GitHub/SNU_BDI/데이터마이닝")
rm(list=ls())


## library 불러오기
library(ISLR)
install.packages('leaps')
library(leaps)

regfit.full = regsubsets(Salary~.,Hitters)
summary(regfit.full)
attach(Hitters)
summary(Hitters)
names(Hitters)
dim(Hitters)

sum(is.na(Hitters$Salary))

Hitters = na.omit(Hitters)
dim(Hitters)

regfit.full <- regsubsets(Salary~.,Hitters)
summary(regfit.full)

regfit.full <- regsubsets(Salary~.,Hitters,nvmax=19)
reg.summary <- (summary(regfit.full))

reg.summary$rsq
reg.summary$adjr2
par(mfrow =c(2,2))

plot(reg.summary$rss,xlab='Number of Variables', ylab='RSS',type = 'l')
plot(reg.summary$adjr2,xlab='Number of Variables', ylab='adjr2',type = 'l')
plot(reg.summary$cp,xlab='Number of Variables', ylab='Cp',type = 'l')
plot(reg.summary$bic,xlab='Number of Variables', ylab='BIC',type = 'l')

# 전진 or 후진 선택법

regfit.fwd <- regsubsets(Salary~.,data=Hitters,nvmax=19,method = 'forward')
summary(regfit.fwd)

regfit.bwd <- regsubsets(Salary~.,data=Hitters,nvmax=19,method = 'backward')
reg.summary <- summary(regfit.fwd)
reg.summary$cp



# 검증셋 기법과 교차검증을 사용한 모델 선택
set.seed(1)
train = sample(c(TRUE,FALSE),nrow(Hitters),rep=TRUE)
test = (!train)

regfit.best = regsubsets(Salary~.,data=Hitters[train,],nvmax=19)
test.mat = model.matrix(Salary~.,data=Hitters[test,])

val.errors <- rep(NA,19)
for (i in 1:19) {
  coefi <- coef(regfit.best,id=i)
  pred<- test.mat[,names(coefi)]%*%coefi
  val.errors[i]<- mean((Hitters$Salary[test]-pred)^2)
}
val.errors
which.min(val.errors)
coef(regfit.best,10)

predict.regsubsets <- function(object,newdata,id,...){
  form <- as.formula(object$call[[2]])
  mat = model.matrix(form,newdata)
  coefi=coef(object,id=id)
  xvars=names(coefi)
  mat[,xvars]%*%coefi
}

k = 10
set.seed(1)
folds <- sample(1:k,nrow(Hitters),replace = TRUE)
cv.errors <- matrix(NA,k,19,dimnames=list(NULL, paste(1:19)))

for (j in 1:k){
  best.fit <- regsubsets(Salary~.,data=Hitters[folds != j,],nvmax=19)
  for (i in 1:19){
    pred = predict(best.fit, Hitters[folds == j,],id=i)
    cv.errors[j,i] = mean( (Hitters$Salary[folds ==j]-pred)^2)
  }
}
mean.cv.errors=apply(cv.errors,2,mean)

par(mfrow=c(1,1))
plot(mean.cv.errors,type='b')
coef(reg.best,11)
