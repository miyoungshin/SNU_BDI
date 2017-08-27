setwd("C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화")
getwd() # 현재 작업 경로 보여줌
rm(list=ls()) # 워크스페이스의 객체 지우기
gc() # 메모리 정리



################################## R 전처리 ##############################
plot(mpg~disp,data=mtcars)
fit <- lm(mpg~disp,data=mtcars)
class(fit) #  lm 클래스라고 뜨는데 이건 s3 클래스
fit1 <- unclass(fit)
class(fit1)
class(fit1) <- 'mylm'  # 새로운 클래스 이름을 만들어줌, lm클래스도 이와 마찬가지로 명명된 클래스
fit1
class(fit1)
plot(fit) 
plot(fit1) # 안됨
class(fit1) <- 'lm' # 클래스명을 다시 지정해주면 다시 됨
plot(fit1) # plot은 다양한 클래스에 대한 defult값을 가지고 있음 
# plot은 데이터 객체에 대한 프레임을 참조해 지정된 그래프를 보여줌

plot(hp~disp, data = mtcars)
x <- rnorm(100)

# 같은 결과를 얻고자 한다면 
set.seed(1)
x <- rnorm(100)
y <- 2+2*x+rnorm(100)   # y(i) = 2+ 2x(i) + e
plot(x,y,main = 'plot(x-y)') # main은 데이터의 이름을 지정해주는 것

y <- x^2 + 2*x + rnorm(100)
plot(x,y,main='title')

# plot의 type
# p = 점을 찍어줌, l = 라인을 그려줌, b =둘다, s = step?
x = seq(-2,2,length = 10)

y = x^2

# p = 점을 찍어줌, l = 라인을 그려줌, b =둘다, s = 계단
plot(x,y,type='p')
plot(x,y,type='l')
plot(x,y,type='b')
plot(x,y,type='s')

# 선과 점의 타입을 lty와 pch로 바꿀 수 있다.
plot(x,y,type='b',lty = 5,pch = 20)
plot(x = 1:25,y = rep(0,25),pch = 1:25)
plot(x = 1:25,y = rep(0,25),pch = 1:5)
plot(x = 1:25,y = rep(0,25),pch = c(1,1,4))


a <- rep(1,25)
a[(1:25)%%3 == 0] <- 3
plot(x = 1:25,y = rep(0,25),pch = a)

# 색상
plot(x,y,type='b',lty = 3, pch = 2 , col = 'blue')
colors()

# 라벨
plot(x,y,type='b',lty = 3, pch = 2 , col = 'blue',xlab = 'xx', ylab = 'yy')
plot(x,y,type='b',lty = 3, pch = 2 , col = 'blue',xlab = 'xx', ylab = 'yy', xlim = c(-1,1), ylim = c(-1,1))

pairs (~mpg+disp+drat+wt,data = mtcars)

# abline 플롯위에 직선을 그려주는 함수
x = rnorm(100)
y = 2+2*x + rnorm(100)
plot(x,y,pch=20)
abline(a=1,b=2,col = 'red')
abline(v=1, col = 'blue')
abline(h=1, col = 'green')

# point
plot(x=1,y=1, type = 'n', xlim=c(0,10), ylim=c(0,5),xlab = 'time', ylab = '# of visiting')
x = 0:10
set.seed(1)
y =rpois(length(x),lambda = 1) # 포아송분포의 모수는 평균븐퍼 하나, 포아송은 카운트 데이터 ( 우리가 셀수 있는 0을 포함한 양의 정수)
points(x,y,col = 'blue',type = 's')
points(x,y,col = 'red',type = 'l')

# lines
plot(0,0, type = 'n', xlim = c(-2,2), ylim = c(-2,2))
x <- c(-2,1,0,1,0)
y <- c(0,-1,2,-2,1)
lines(x,y)

# NA값이 들어간다면? -> 우리나라 지도를 그릴때 섬이 있는 경우 활용하면 ㄷ
plot(0,0, type = 'n', xlim = c(-2,2), ylim = c(-2,2))
x <- c(-2,1,NA,1,0)
y <- c(0,-1,NA,-2,1)
lines(x,y)

plot(0,0,type='n',xlim = c(1,5), ylim = c(0,2))
x = seq(1,5,by=1)
abline(v = x,lty = 1:length(x))

# legend

z = sort(rnorm(100))
y1 = 2 + x + rnorm(100)
plot(z,y1,col='blue',pch = 3)
points(z,y1/2, col = 'red',pch=19)
legend("topright" , c('pch_3','pch_19'),col=c('blue','red'),pch= c(3,19))

# par
par(mfrow = c(2,1)) # 그림은 행이 2개 열이 1개인 layout을 생성
par(cex = 1.2) # 글자 크기 character expansion 1.2배
par(bg = 'gray90') # background
par(las = 2) # las -  서식의 문자를 직교하게 -> 2
par(mai - c(1,2,3,4)) #밑 왼쪽 오른쪽 위


par (mfrow = c(2,2), bg = 'gray50', col = 'white', col.main = 'lightblue',col.axis = 'yellow',col.lab = 'lightgreen')
x = rnorm(100)
y = 2+2*x +rnorm(100)
plot(x,y,main='plot (X-y)-1',pch=20)
dev.off()
# 마무리 하기 p50


# Regression
set.seed(1)
x <- sort(rnorm(100))
y <- 3+x^2+rnorm(100)
plot(x,y,pch=20)
fit <- lm(y~x)
fit
abline(a = fit$coefficients[1], b = fit$coefficients[2], col = 'blue')
i
yTrueMean <- 3+x^2
lines(x,yTrueMean,lty=2,col='black')

#케이근방 알고리즘
install.packages('FNN')
library(FNN)
knnx.index(x,0,k=10)
idx <- c(knnx.index(x,0,k=10))
yhat <- mean(y[idx])
eval.point = 0
plot(x,y, pch=20)
abline(v = 0, col='black')
idx <- c(knnx.index(x,eval.point,k=10))
points(x[idx],y[idx],col='red',pch=20)
abline(h=mean(y[idx],lty=2, col = 'red'))
mean(y[idx])


# x가 1일때 
knnx.index(x,0,k=10)
idx <- c(knnx.index(x,0,k=10))
yhat <- mean(y[idx])
eval.point = 1
plot(x,y, pch=20)
abline(v = 0, col='black')
idx <- c(knnx.index(x,eval.point,k=10))
points(x[idx],y[idx],col='red',pch=20)
abline(h=mean(y[idx],lty=2, col = 'red'))
mean(y[idx])

# x가 -1 일때
knnx.index(x,0,k=10)
idx <- c(knnx.index(x,0,k=10))
yhat <- mean(y[idx])
eval.point = -1
plot(x,y, pch=20)
abline(v = 0, col='black')
idx <- c(knnx.index(x,eval.point,k=10))
points(x[idx],y[idx],col='red',pch=20)
abline(h=mean(y[idx],lty=2, col = 'red'))
text(0,1,labels = round(mean(y[idx])))

# 종합
eval.n = 100
eval.point = seq(-3,3,length=eval.n)
plot(x,y,pch = 20)
idx.mat



# 3d catterplot
install.packages('scatterplot3d')
library(scatterplot3d)
install.packages('rgl')
library(rgl)
attach(mtcars)
plot3d(wt,disp,mpg,col='red',size=3)


mypal= c('blue','red','green')
class(mtcars$cyl)
factor(mtcars$cyl)
a <- mypal[factor(mtcars$cyl)]
plot3d(wt,disp,mpg,col= a)

# surface 
library(rgl)
z <- 2 * volcano
x <- 10 *(1:nrow(z))
y <- 10 *(1:ncol(z))
par(bg = 'slategray')
persp(x, y, z, theta = 135, phi = 30, col = 'green3', scale = FALSE, ltheta = -120, shade = 0.75, border = NA, box = FALSE)

persp3d(x, y, z, col = "green3")
