
set.seed(1)
y = c(1)
for (i in 1:100) {
  y[i] <- rnorm(1,0,1)
}

x <- matrix(rep(1,100),100,1)
y <- matrix(y,100,1)

a <- x%*%solve(t(x)%*%x)%*%t(x)%*%y
# 가장 가까운 생성공간으로 정사영하기 때문에 한점으로 값이 귀결
# 특정 점은 생성 공간 위에 있어야 함 (y랑 가장 가까운 생성 공간 위의 한 점에 있어야 함)

mean(y) # 정사영 공간에서 베타의 값

new_y <- y - a # y중에 1과 설명할 수 있는 부분을 없앤 값


install.packages("igraph")
library(igraph)

Sigma  = matrix(c(1,0,0.5,
                  0,1,0.3,
                  0.5,0.3,1)
                ,3,3)
Sigma.cov <- Sigma # sigma matrix에서 0이 많다고 해서 역행렬이 0이 많다고 볼 순 없다.




Sigma  = matrix(c(1,0,0.5,0,
                  0,1,0.3,0.2,
                  0.5,0.3,1,0,
                  0,0.2,0,1)
                ,4,4)
Sigma11<- Sigma[1:2,1:2]
Sigma12<- Sigma[1:2,3:4]
Sigma21<- Sigma[3:4,1:2]
Sigma22<- Sigma[3:4,3:4]
tmp<-Sigma11 - Sigma12%*%solve(Sigma22)%*%Sigma21 # 볼드 X2가 주어진 경우 볼드X1의 공분산 행렬 
tmp[1,2]/sqrt(tmp[1,1]*tmp[2,2]) # partial Cor.
solve(Sigma)
solve(Sigma)

install.packages('glasso')
library(glasso)
x<-matrix(rnorm(50*20),ncol=20)
s<- var(x)
a<-glasso(s, rho=.01)
str(a)
a$wi # 20by20 precison matrix
aa<-glasso(s,rho=.02, w.init=a$w, wi.init=a$wi)
aa$wi

install.packages('arulesViz')
library(arulesViz)
data("Groceries")
head(Groceries)
str(Groceries)
