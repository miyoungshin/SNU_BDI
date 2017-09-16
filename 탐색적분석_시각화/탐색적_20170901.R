n = 1e+4
z = rexp(n)
x = c()
for (i in 1:n){
  idx = sample(1:n,25)
  x[i] = mean(z[idx])
}
hist(x)

n = 1e+4
z = runif(n)
x = c()
for (i in 1:n){
  idx = sample(1:n,25)
  x[i] = mean(z[idx])
}
hist(x)



n =100000
x= 0.1
b0= -1
b1 = 2
(1+(0.1)/n)^n
exp(1)
exp(b0+b1*x)
lambda =2
x = 3
lambda^x*exp(-lambda*x)
x = seq(0,10, length = 100)
x
y <- ppois(x,lambda = 5)
plot(x,y,type = 's',ylim=c(0,1),lty= 3) # 좌극한, 우극한의 차이는 확률

a <- rpois(5000,lambda = 5) # 평균이 5인 포아송 분포
mean(a)
var(a)

n = 1e+4
z = rexp(n)
x = c()
hist(z)
for (i in 1:n)
{
  idx = sample(1:n,25)
  x[i] = mean(z[idx])
}
hist(x)

n = 1e+4
z = runi(n)
for (i in 1:n)
{
  idx = sample(1:n,25)
  x[i] = mean(z[idx])
}
hist(x)

gamma(2)
gamma(3)
gamma(4)
gamma(5)
gamma(5)/gamma(4)

a <- dgamma(2,0.5)
hist(a)
diag(2,2,1)
a = c(1,2,3)
a = matrix(1:3,3,1)
a
t(a)%*%a
X <- matrix(1:9,3,3)
X
solve(t(X)%*%X)
mu.vec = matrix(c(0,1,-1),3,1)
sigma.mat = matrix(c(1,0.5,0,0.5,1,0.3,0,0.3,1),3,3)
x =matrix(c(1,0,1/2),3,1)
exp(-1/2%*%t(x-mu.vec)%*%solve(sigma)%*%(x-mu.vec))
solve(sigma.mat) %*% sigma.mat
det(sigma.mat)
install.packages('mvtnorm')
library(mvtnorm)
library(mvtnorm)
library(rgl)
n = 50
mu.vec = c(1,1/2)
Sigma.mat = matrix( c(1,0,0,2),2,2)
x1 = x2 = seq(-3,3, length = n)
z <- matrix(0,n,n)
for (i in 1:n)
  for (j in 1:n)
    z[i,j] <- dmvnorm(c(x1[i],x2[j]), mu.vec, Sigma.mat)
contour(x1,x2,z)
persp3d(x1,x2,z, col='green')
