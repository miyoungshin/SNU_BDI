# 강의    교재 : introduce to statistical learning
# chapter 4 Lab: 재표본추출 방법 / p.218
#-------------------------------------------------
setwd("C:/Users/User/Documents/GitHub/SNU_BDI/데이터마이닝")
setwd("/Users/arnorfati/Documents/GitHub/SNU_BDI/데이터마이닝")
rm(list=ls())


## library 불러오기
library(ISLR)
library(boot)

# 1. 검증셋 기법
summary(Auto)

set.seed(1)
train = sample(392,196)

lm.fit = lm(mpg~horsepower, data = Auto, subset = train)

attach(Auto)
mean((mpg-predict(lm.fit,Auto))[-train]^2) #(Y - Yhat)^2 인데 여기서 train set을 제외하기 위해 [-train]

# 1-1. 다항회귀 적용
lm.fit2 = lm(mpg~poly(horsepower,2), data = Auto, subset = train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

lm.fit3 = lm(mpg~poly(horsepower,3),data=Auto,subset = train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)
# 2차 함수로 모델링 했을 때 1차 보다 성능이 확연히 좋아짐 , 반변 3차함수로 모델링 했을 땐 2차 보다 확연히 좋아지지는 않음

# 1-2set.seed()를 바꾸었을 때
set.seed(2)
train = sample(392,196)

lm.fit = lm(mpg~horsepower, data = Auto, subset = train)
mean((mpg-predict(lm.fit,Auto))[-train]^2) #(Y - Yhat)^2 인데 여기서 train set을 제외하기 위해 [-train]
# set.seed()를 바꾸면 결과값이 차이난다. set.seed(1)일때 26.14 / set.seed(2)일때 23.29

# 2. LOOCV
glm.fit <- glm(mpg~horsepower, data= Auto) # famliy = binomial 없이 glm을 쓰면 lm과 같음
coef(glm.fit)

cv.err = cv.glm(Auto,glm.fit)

# 2-1 다항회귀 적용

cv.error = rep(0,5)
for (i in 1:5) {
  glm.fit <- glm(mpg~poly(horsepower,i),data= Auto)
  cv.error[i] = cv.glm(Auto,glm.fit)$delta[1]
}
cv.error # 2차 이후로 뚜렷한 변화가 없음

# 3. k-fold 교차검증
cv.error.10 = rep(0,10)
for (i in 1:10){
  glm.fit <- glm(mpg~poly(horsepower,i),data=Auto)
  cv.error.10[i] <- cv.glm(Auto,glm.fit,K=10)$delta[1] # cv.glm에 K = 10을 넣어주면 됨
}
cv.error.10 # LOOCA와 마찬가지로 2차함수까지는 의미있는 변화, 그 이후에는 의미 없음

# 4. 붓스트랩

# 4-1. 통계량 생성
summary(Portfolio)

alpha.fn = function(data,index) {
  X = data$X[index]
  Y = data$Y[index]
  return((var(Y)-cov(X,Y))/(var(X)+var(Y)-2*cov(X,Y)))
}

alpha.fn(Portfolio,1:100) # 만든 함수를 바탕으로 alpha 추정치 계산

set.seed(1)
alpha.fn(Portfolio,sample(100,100,replace = T)) # 100개 중 100개를 복원 추출해   alpha 추정치 계산

boot(Portfolio, alpha.fn,R = 1000) # 1000개의 bootstrap 추정치

