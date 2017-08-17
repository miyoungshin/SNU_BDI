setwd("C:/Users/User/Documents/GitHub/SNU_BDI/데이터마이닝")
library(ISLR)
str(Smarket)
summary(Smarket[,c(1,7,8,9)])
plot(Smarket)
cor(Smarket[,-9])
attach(Smarket)
train <- (Smarket$Year<2005)
Smarket.2005 <- Smarket[!train,]
Smarket.2005
length(Smarket$Year)
length(Smarket.2005$Year)
length(Smarket[train,]$Year)
train
dim(Smarket.2005)

Direction.2005 = Direction[!train]
Direction.2005


