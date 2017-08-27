setwd("C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화")
getwd() # 현재 작업 경로 보여줌
rm(list=ls()) # 워크스페이스의 객체 지우기
gc() # 메모리 정리


################################## R 시각화 ##############################
install.packages('xlsx')
install.packages('rJava')
library(rJava)
library(xlsx)

A <- data.frame(x1 = rep(0,10), x2 = rep('b',10))
B <- data.frame(x3 = rep(1,10), x2 = rep('d',10))
AB <- cbind(A,B)
AB <- rbind(A,B) # 데이터명이 달라서 안됨

attach(mtcars) # 데이터를 고정시킬 때 쓰임, 해제할땐 detach(data명)

head(mtcars) # 개괄적인 데이터 개요 확인

# PLOT함수
plot(mpg ~ disp, data = mtcars) # attach해도 plot함수는 data를 입력해야 함
plot(hp ~ disp, data = mtcars)

X = rnorm(100)
Y = 2 + 2*X + rnorm(100)

plot(X,Y, main = 'plot(x-y)') # plot(Y~X)와 같음

## plot 타입은 총 'p','l','b','s'
x <- seq(-2,2, length = 10)
y = x^2
plot(x,y, type = 'b', main = 'Y = X^2')

## 선의 타입도 바꿀 수 있음
plot(x,y, type = 'b', lty = 3, main = 'Y = X^2')

## 점의 모양도 바꿀 수 있음
plot(x,y, type = 'b',pch = 2, main = 'Y = X^2')
plot(x = 1:25,rep(0,25), pch = 1:25)

## 색상 변경 가능 (색상에 대한 자세한 코딩은 3주차때 배움) 
plot(x,y, type = 'b',pch = 2, main = 'Y = X^2', col = 'blue')
colors()[1:10]

## 범위 설정
plot(x,y, type = 'b',xlab='X',ylab='y', main = 'y=x^2',xlim = c(-1,1), ylim = c(-1,1))


# 여러개의 산점도
pairs(~mpg+disp+drat+wt, data = mtcars, main = 'simple scatterplot Matrix')

# Add lines and point

#abline

x = rnorm(100)
y = 2 + 2*x + rnorm(100)
plot(x,y,main = 'scatter plot')

abline(a = 1, b = 2 ,col = 'red') # 절편은 a 기울기는 b를 갖는 직선
abline(h = 1 , col = 'blue') # 수평선 h를 갖는 직선
abline(v = 1 , col = 'green') # 수직선 v를 갖는 직선

# points
plot(x,y,type = 'n',xlim = c(0,10), ylim = c(0,5),xlab = 'time', ylab = '# of visiting') # 빈 공간을 갖는 plot
x = 0:10
set.seed(1)
y = rpois(length(x), lambda = 1) # 포아송 분포, 일정 단위시간에서 사건이 랜덤하게 발생하는 경ㅇ
points(x,y, col = 'blue', type = 's')
points(x,y, col = 'red', type = 'l')

# lines
plot(0,0,type = 'n', xlim = c(-2,2), ylim = c(-2,2))
x = c(-2,1,0,1,0)
y = c(0,-1,2,-2,1)
lines(x,y)

plot(0,0,type = 'n',xlim = c(1,5), ylim = c(0,2))
x = seq(1,5, by = 1)
abline(v = x, lty = 1:length(y))

#legend()
z = sort(rnorm(100))
y1 = 2+x+rnorm(100)

plot(z,y1,col = 'blue',pch = 3)
points(z,y1/2, col = 'red',pch = 19)
legend('topright', c('pch_3','pch_19'), col = c('blue','red'), pch = c(3,19))
legend('bottomright', c('pch_3','pch_19'), col = c('blue','red'), pch = c(3,19))

# par()
par(mfrow= c(2,2),bg = 'gray50', col = 'white', col.main = 'lightblue',col.axis = 'yellow', col.lab = 'lightgreen')

x = rnorm(100)
y = 2+2*x+rnorm(100)
plot(x,y,main = 'plot(x-y)-1', pch =20)

y = 2 + x +rnorm(100)
plot(x,y/2,main = 'plot(x-y)-2')
plot(x,y/3,main = 'plot(x-y)-3',col.main = 'black')
plot(x,y/4,main = 'plot(x-y)-4',col.axis = 'white')


# 3D 
library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt,disp,mpg, main = '3D Scatterplot')


library(rgl)
plot3d(wt,disp,mpg,col = 'red', size = 3)
mypal = c('red','blue','green')


class(mtcars$cyl)
factor(mtcars$cyl)
mypal[factor(mtcars$cyl)]
plot3d(wt,disp,mpg,col=mypal[factor(mtcars$cyl)],size=10)

# 3D surface
par(mfrow = c(1,1))
z <- 2 * volcano
x <- 10 * (1:nrow(z))
y <- 10 * (1:ncol(z))

par(bg = 'slategray')
persp(x, y, z, theta = 135, phi = 30, col = 'green3', scale = FALSE, ltheta = -120, shade = 0.75, border = NA, box = FALSE)
persp3d(x,y,z, col = 'green3')
