setwd("/Users/arnorfati/Documents/GitHub/SNU_BDI/데이터마이닝")
install.packages('glm')

# imblanced data는 rare event에 대해 logistic 을 적용하기 위해, 이 경우 bias가 존재
B=100
est=matrix(0,B,3)
r=0.1
beta0=-7
beta1=1 

for(k in (1:B)){
  
  n0=10000
  n1=n0*r
  n=n0+n1
  x=c(rep(0,n0),rep(1,n1))
  
  eta=exp(beta0+beta1*x)
  prob=eta/(1+eta)
  y=rep(0,n)
  for(i in (1:n)){
    y[i]=rbinom(1,1,prob[i])
  }
  
  glm.fit=glm(y~x,family=binomial)
  est[k,1]=sum(y)/n*100
  est[k,2:3]=as.vector(glm.fit$coefficients) 
  
  cat("\n")
  cat(k) # k값을 출력
}
apply(est,2,mean)
apply(est,2,var)

# 변수 선택

B=200 # 횟수
nums=rep(0,200)

for(k in (1:B)){
  
  n=300 
  y=rbinom(n,1,0.5)
  x=matrix(rnorm(n*100),n,100)
  
  fullmod = glm(y~x,family=binomial)
  pval=coef(summary(fullmod))[,4]
  nums[k]=sum(pval<0.05)
}
nums
summary(nums)


# 2.2 step function 

n=200 
y=rbinom(n,1,0.5)
x=matrix(rnorm(n*100),n,100)

fullmod = glm(y~x,family=binomial)
summary(fullmod)

nothing <- glm(y ~ 1,family=binomial)
summary(nothing)

backwards = step(fullmod)
backwards = step(fullmod,trace=0) 
formula(backwards)
summary(backwards)

forwards =step(nothing,scope=list(lower=formula(nothing),
                                  upper=formula(fullmod)), direction="forward")
formula(forwards)

bothways =step(nothing, list(lower=formula(nothing),
                             upper=formula(fullmod)), direction="both",trace=0)
formula(bothways)

# 2.3 BIC 의 계산 

AIC(fullmod,k=log(n))
AIC(fullmod,k=2)
AIC(fullmod)
AIC(nothing,k=log(n))
AIC(nothing,k=2)
AIC(nothing)


#ROC

library(ISLR)
attach(Smarket)
train = (Year<2005)
Smarket.2005=Smarket[!train,]
dim(Smarket.2005)
glm.fit <- glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,family = binomial,subset=train)
glm.probs=predict(glm.fit,Smarket.2005,type="response")
probs=as.numeric(glm.probs)
tclass=as.numeric(Direction[!train])
c=sort(probs)
B=length(c)
roc=matrix(0,B,2)


#
# Y-axis = Sensitivity = True positive rate
#         =TP/P= TP/(TP+FN)
# X-axis = 1-Specificity= False postive rate 
#          =FP/N = FP/(TN+FP)
#
#

for(k in (1:B)){
  dclass=as.numeric(probs>c[k])
  roc[k,2]=sum((dclass==1)&(tclass==2))/sum(tclass==2)
  roc[k,1]=sum((dclass==1)&(tclass==1))/sum(tclass==1)
  
}

plot(roc[,1],roc[,2])
abline(0,1,col="red")

#3.2 ROC 곡선 -2 


n=100

y=rbinom(n,1,0.5)
x=matrix(rnorm(n*10),n,10) # 행이 100개, 열이 10개인 행렬
eta= x[,1]+x[,2]
probs=exp(eta)/(1+exp(eta))
for(i in (1:n)){
  y[i]=rbinom(1,1,probs[i])
}


m=100 
ty=rbinom(n,1,0.5)
tx=matrix(rnorm(n*10),n,10)
teta=tx[,1]+tx[,2]
tprobs=exp(teta)/(1+exp(teta))
for(i in (1:n)){
  ty[i]=rbinom(1,1,tprobs[i])
}

# 변수를 모두 넣었을 때


glm.fit=glm(y~x,family=binomial)
est=as.numeric(glm.fit$coefficients) 
peta=est[1]+tx%*%est[2:11] 
pprob=exp(peta)/(1+exp(peta))

c=sort(pprob)
B=length(c)
tclass=ty

for(k in (1:B)){
  
  dclass=as.numeric(pprob>c[k])
  roc[k,2]=sum((dclass==1)&(tclass==1))/sum(tclass==1)
  roc[k,1]=sum((dclass==1)&(tclass==0))/sum(tclass==0)
}

plot(roc[,1],roc[,2],type="l")
abline(0,1,col="red")

# 정확한 모델


glm.fit=glm(y~x[,1:2],family=binomial)
est=as.numeric(glm.fit$coefficients) 
peta=est[1]+tx[,1:2]%*%est[2:3] 
pprob=exp(peta)/(1+exp(peta))

c=sort(pprob)
B=length(c)
tclass=ty


#
# Y-axis = Sensitivity = True positive rate
#         =TP/P= TP/(TP+FN)
# X-axis = 1-Specificity= False postive rate 
#          =FP/N = FP/(TN+FP)
#
#
roc=matrix(0,B,2)
for(k in (1:B)){
  dclass=as.numeric(pprob>c[k])
  roc[k,2]=sum((dclass==1)&(tclass==1))/sum(tclass==1)
  roc[k,1]=sum((dclass==1)&(tclass==0))/sum(tclass==0)
}

plot(roc[,1],roc[,2],type="p")
abline(0,1,col="red")




