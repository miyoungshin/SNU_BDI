# 강의    교재 : introduce to statistical learning
# chapter 6 Lab: 선형모델 선택 및 정규화 / p.281
#-------------------------------------------------
setwd("C:/Users/User/Documents/GitHub/SNU_BDI/데이터마이닝")
setwd("/Users/arnorfati/Documents/GitHub/SNU_BDI/데이터마이닝")
rm(list=ls())


## library 불러오기
library(ISLR)
library(leaps)
library(glmnet)


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
# train = sample(c(TRUE,FALSE),nrow(Data),rep=TRUE)
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

# 리찌, 라소
str(Hitters)
# 누락된 원소 제거하기
Hitters <- na.omit(Hitters)

# 라쏘는 glmnet을 활용함 이때 glmnet은 x는 행렬로 y는 벡터로 보내야 함

x = model.matrix(Salary~.,Hitters)[,-1]
y = Hitters$Salary

# lambda값을 10^10 ~ 10^-2까지 
grid = 10^seq(10,-2,length=100) # 

# 리찌 식에 적용
rigde.mod = glmnet(x,y,alpha = 0, lambda = grid)
dim(coef(rigde.mod)) # 20개의 변수에 대한 lambda값을 적용한 식

rigde.mod$lambda[50]
coef(rigde.mod)[,1] # 람다값이 50일때 coef
grid[1]
coef(rigde.mod)[,50]
grid[50]

rigde.mod$lambda[60]
coef(rigde.mod)[,60]
sqrt(sum(coef(rigde.mod)[-1,60]^2)) #계수 추정치, 정확한 의미는?

?predict
predict(rigde.mod,s = 50,type='coefficients')[1:20,]

# test & validation set 만들기
set.seed(1)
train = sample(1:nrow(x),nrow(x)/2)
test = (-train)
y.test = y[test]

ridge.mod = glmnet(x[train,],y[train],alpha = 0,lambda = grid, thresh = 1E-12)
ridge.pred = predict(ridge.mod, s = 4, newx = x[test,])
mean((ridge.pred-y.test)^2)


# 조율 파라미터 선택 리찌

set.seed(1)
cv.out <- cv.glmnet(x[train,],y[train],alpha = 0)
plot(cv.out)
bestlam = cv.out$lambda.min
# 교차검즈을 통해 오차가 가장 작은 lambda값은 212임


lasso.mod = glmnet(x[train,],y[train],alpha = 1, lambda = grid)
plot(lasso.mod)

set.seed(1)
cv.out = cv.glmnet(x[train,],y[train],alpha = 1)
plot(cv.out)
bestlam = cv.out$lambda.min

lasso.pred = predict(lasso.mod,s = bestlam,newx=x[test,])
mean((lasso.pred - y.test)^2)
