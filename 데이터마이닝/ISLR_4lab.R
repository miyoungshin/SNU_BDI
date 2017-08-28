# 강의    교재 : introduce to statistical learning
# chapter 4 Lab: 분류 / p.178
#-------------------------------------------------
setwd("C:/Users/User/Documents/GitHub/SNU_BDI/데이터마이닝")
setwd("/Users/arnorfati/Documents/GitHub/SNU_BDI/데이터마이닝")
rm(list=ls())


## library 불러오기
library(ISLR)

## 4.6.1 주식시장 자료
names(Smarket)
dim(Smarket)
summary(Smarket)
str(Smarket)
pairs(Smarket)
cor(Smarket) # Direction 변수가 factor이기 때문에 안됨
cor(Smarket[,-9])
attach(Smarket)
plot(Volume)
plot(Year,Volume)

# 로지스틱 회귀
glm.fit = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data = Smarket,family = binomial)
summary(glm.fit)
names(summary(glm.fit))

summary(glm.fit)$coef
coef(glm.fit)

glm.probs = predict(glm.fit,type='response')
glm.probs[1:10]

glm.pred = rep('Down',1250)
glm.pred[glm.probs > 0.5] = 'up'

table(glm.pred,Direction)
(145+507)/length(glm.pred)
mean(glm.pred == Direction)

train = (Year < 2005)
Smarket.2005 = Smarket[!train,]
Direction.2005 = Direction[!train]
dim(Smarket.2005)

glm.fit = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data = Smarket,family = binomial,subset = train)
glm.probs = predict(glm.fit,Smarket.2005,type='response')
glm.pred = rep('down',length(Smarket.2005$Year))
glm.pred[glm.probs > 0.5] = 'Up' 
table(glm.pred,Direction.2005)
mean(glm.pred == Direction.2005)
mean(glm.pred != Direction.2005)

glm.fit = glm(Direction~Lag1+Lag2,data = Smarket,family = binomial,subset = train)
glm.probs = predict(glm.fit,Smarket.2005,type='response')
glm.pred = rep('down',length(Smarket.2005$Year))
glm.pred[glm.probs > 0.5] = 'Up' 
table(glm.pred,Direction.2005)
mean(glm.pred == Direction.2005)

# 선형 판별 분석
library(MASS)
lda.fit = lda(Direction~Lag1+Lag2,data = Smarket,family = binomial,subset = train)
lda.fit
lda.pred = predict(lda.fit, Direction.2005)
lda.class = lda.pred$class
table(lda.class,Direction.2005)

# 이차 판별 분석
qda.fit = qda(Direction~Lag1+Lag2,data = Smarket,family = binomial,subset = train)
qda.fit
qda.class=predict(qda.fit,Smarket.2005)$class
qda.pred = predict(qda.fit, Smarket.2005)
qda.class = qda.pred$class
table(qda.class,Direction.2005)
