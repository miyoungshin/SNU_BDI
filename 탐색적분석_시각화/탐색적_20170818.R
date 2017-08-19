setwd("/Users/arnorfati/Documents/GitHub/SNU_BDI/탐색적분석_시각화")

if (!require(plotrix)) install.packages("plotrix")
if (!require(vioplot)) install.packages("vioplot")
if (!require(vcd)) install.packages("vcd")

library(plotrix)
library(vioplot)
library(vcd)
counts = table(state.region)
counts
barplot(counts)
cyl <- mtcars$cyl
freq.cyl <- table(cyl)
cyl.name <- c('4 cyl','6 cyl', '8 cyl')
barplot(freq.cyl,main = 'simple car chart', col = 'orange',names.arg = cyl.name)

##pie chart
paste('a','b',sep='_')
paste0(c('4 cyl','6 cyl'),'(',c(30,20),'%)')
cyl.name2 <- paste0(cyl.name,"(",freq.cyl,"%)")
pie(freq.cyl, labels = cyl.name2, col = rainbow(length(freq.cyl)), main='pie chart')

# 3차원
library(plotrix)
pie3D(freq.cyl,labels = cyl.name2,explode = 0.1)
fan.plot(freq.cyl, labels = cyl.name2, main = 'Fan plot')


# 색상
rainbow(10)

#Frequency table
library(vcd)
head(Arthritis, 3)
str(Arthritis)

my.table <- xtabs(~ Treatment+Improved, data = Arthritis)
my.table
# dim -> 총 84명의 환자에 대해 5가지 변수로 측정
dim(Arthritis)
my.table <- xtabs(~ Treatment+Improved, data = Arthritis)

# 원하는 결과를 쉽게 볼수 없음
barplot(my.table, xlab = 'improved', ylab = 'Frequency', legend.txt = TRUE,col= c('green','red'))
my.table
# 결과를 쉽게 볼 수 있음
barplot(t(my.table), xlab = 'improved', ylab = 'Frequency', legend.txt = TRUE,col= c('green','red','orange'))
t(my.table)

tmp <- c('buckled','unbuckled')
belt <- matrix(c(52,2,8,16), ncol = 2, dimnames = list(parent = tmp,child = tmp))
belt
spine(belt, main='spine plot for child seat-belt usage',gp = gpar(fill = c('green','red')))
x <- rnorm(100)
boxplot(x,main = 'boxplot', col = 'lightblue')
x <- faithful$waiting
x
hist(faithful$waiting, nclass = 8,probability = T)
hist(faithful$waiting, breaks = seq(min(x),max(x),length = 10), probability = T)
summary(x)
lines(density(x),col = 'red', lwd =2)
install.packages('vioplot')

attach(mtcars)
boxplot(mpg~cyl, data = mtcars, names = c('4 cyl', '6 cyl', '8 cyl'))
par(mfrow = c(3,1))
hist(mpg[cyl==4], xlab='MPG', main = 'MPG dis by cylinder', xlim= c(5,40), ylim = c(0,10),col = 'lightblue')
hist(mpg[cyl==6], xlab='MPG', main = 'MPG dis by cylinder', xlim= c(5,40), ylim = c(0,10),col = 'orange')
hist(mpg[cyl==8], xlab='MPG', main = 'MPG dis by cylinder', xlim= c(5,40), ylim = c(0,10),col = 'red')

# xlim 이 없으면 서로 비교해복 힘듬, 같은 기준으로 설정 해줘야함
hist(mpg[cyl==4], xlab='MPG', main = 'MPG dis by cylinder', ylim = c(0,10),col = 'lightblue')
hist(mpg[cyl==6], xlab='MPG', main = 'MPG dis by cylinder', ylim = c(0,10),col = 'orange')
hist(mpg[cyl==8], xlab='MPG', main = 'MPG dis by cylinder', ylim = c(0,10),col = 'red')

?legend

# R color

## palette
plot(1:20,y = rep(0,20), col = 1:20,cex=3, pch= 20)
# 기본적으로 숫자에는 8가지 숫자를 할당되어 있음 
head(colors())
mycol = colors()
par(mfrow = c(1,1))
plot(1:80,y=rep(1,80),col=mycol[1:80],cex = 2,pch= 20, ylim = c(0,1))
points(1:80, y=rep(0.5,80),col=mycol[81:160],cex = 2,pch= 20)
points(1:80, y=rep(0,80),col=mycol[161:240],cex = 2,pch= 20)

image(matrix(1:25^2,25,25),col=mycol)

a <- heat.colors(100,alpha =1)
plot(1:100,rep(0,100),col = a, pch =20)
b <- topo.colors(200,alpha=1)
plot(1:200,rep(0,200),col = b, pch =20)
x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))
image(x,y,volcano,col = mycol, axes = F)
contour(x,y,volcano,levels= seq(90,200,by = 5), add = TRUE,col = 'white')

# color를 만들고 싶을때
install.packages('colorspace')
library(colorspace)
pal = choose_palette()
mycol <- pal(150)
plot(1:30,rep(0,30),col = mycol,pch=20)
