# 강의 교재 introduce to statistical learning
# 3.6 Lab: 선형회귀 / p.123

setwd("/Users/arnorfati/Documents/GitHub/SNU_BDI/데이터마이닝")

## library 불러오기
library(MASS)
library(ISLR)



## 단순선형 회귀
fix(Boston)
names(Boston)
attach(Boston)
lm.fit = lm(medv~lstat,data=Boston)
lm.fit # 기본적인 정보만 알려줌
summary(lm.fit)

confint(lm.fit) # 계수 추정치에 대한 신뢰구간

# 신뢰구간과 예측구간의 비교, 예측구간이 더 넓다.
predict(lm.fit,data.frame(lstat=c(5,10,15)),interval = 'confidence')
predict(lm.fit,data.frame(lstat=c(5,10,15)),interval = 'prediction')

plot(lstat,medv)
# attach(Boston) 명령어를 사용하지 않았다면 plot(Boston$lstat,Boston$medv)로 해야 함
abline(lm.fit,lwd = 3,col = 'red')

par(mfrow=c(2,2))
plot(lm.fit) # 진단그래프
plot(predict(lm.fit),residuals(lm.fit))
plot(predict(lm.fit),rstudent(lm.fit))
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))


## 다중선형회귀
lm.fit = lm(medv~lstat+age) # data = Boston을 안해도 됨( attach(Boston) 때문)
summary(lm.fit)

# 모든 변수를 활용해 다중선형회귀식을 수행하고 싶을땐
lm.fit = lm(medv~.,data = Boston) # attach(Boston)을 했는데도 data= 를 작성해야 함...

install.packages('car')
library(car)
vif(lm.fit)

# 한 변수를 제외하고 회귀식을 수행하기
lm.fit1 = lm(medv~.-age ,data = Boston)
summary(lm.fit)
