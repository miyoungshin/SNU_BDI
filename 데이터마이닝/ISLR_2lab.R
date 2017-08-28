# 강의    교재 : introduce to statistical learning
# chapter 2 Lab: 통계학습 / p.44
#-------------------------------------------------
setwd("C:/Users/User/Documents/GitHub/SNU_BDI/데이터마이닝")
setwd("/Users/arnorfati/Documents/GitHub/SNU_BDI/데이터마이닝")

## 기본 명령어
x <- c(1,3,2,5)
x = c(1,6,2)
y = c(1,4,3)

length(x)
x+y

ls()
rm(x,y)
rm(list = ls())

x <- matrix(data = c(1,2,3,4),2,2)

x <- matrix(data=c(1,2,3,4),2,2,byrow = TRUE)

x_2 <- x^2

x_2
sqrt(x)

x = rnorm(50)

y = x +rnorm(50, mean = 50, sd = 0.1) # R에서는 정규분포의 모수가 평균과 표준편차임 (원래는 평균과 분산)
plot(x,y)

cor(x,y)

set.seed(1303)
rnorm(50)

set.seed(3)
y = rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)

# 그래프
x = rnorm(100)
y = rnorm(100)

plot(x,y)
plot(x,y,xlab = 'This is xlab', ylab = 'This is ylab', main = 'Plot of X vs Y')
pdf('Figure.pdf')
plot(x,y,col = 'green')
dev.off()

x = seq(1,10)
x
x = 1:10
x

# 등고선 그리는 그래프
x = seq(-pi,pi,length = 50)
y = x
f = outer(x,y,function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)
fa = (f-t(f))/2
contour(x,y,fa,nlevels=15)

# image
image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa,theta=30)
persp(x,y,fa,theta=30, phi = 20) # theta 와 phi는 그래프를 볼 수 있는 각도를 조정
persp(x,y,fa,theta=30, phi = 70)
persp(x,y,fa,theta=30, phi = 40)

# 데이터 인덱싱
A = matrix(1:16,4,4)
A
A[2,3]
A[c(1,3),c(2,4)]
A[c(1,2),]
A[,1:2]
A[1,]
A[-c(1,3),]
dim(A)

# 데이터 로딩
library(ISLR)
head(Auto)
dim(Auto)
names(Auto)

# 추가적인 그래프와 수치 요약
plot(cylinders,mpg) # 어떤 데이터인지 정해지지 않았음
plot(Auto$cylinders,Auto$mpg)
attach(Auto)
plot(cylinders,mpg)
cylinders = as.factor(cylinders)
plot(cylinders,mpg, col = 'red', varwidth = T) # 분산의 넓이도 포함

hist(mpg)
hist(mpg,col = 1)
hist(mpg,breaks=100)

pairs(Auto)

plot(horsepower,mpg)
identify(horsepower,mpg,name)

summary(Auto)
