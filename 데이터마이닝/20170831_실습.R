
install.packages('glmnet')
setwd('C:/Users/User/Documents/GitHub/SNU_BDI/데이터마이닝')
library(glmnet)
# 모델을 fitting 시킬 때 minize

Package_Data_List <- data(package = 'glmnet')
Package_Data_List$results # Item 항목을 보면 사용 할 수 있는 데이터가 있음

data(BinomialExample) # 로지스틱회귀에 사용

fit <- glmnet(x,y,family = 'binomial')
predict(fit, newx = x[1:5,],type = 'class',s = c(0.05,0.01)) # binomial은 class, 0.05 결과값의 첫번째는 lamda의 첫번째 값 나머진 두번째 값

german = read.csv('german_numeric.csv',header=T)
train = c(1:600)
test = c(601:1000)
german[,16] <- german[,16]-1
Response <- rep(0,1000)
for (i in c(1:1000)){
  if (german[i,16]==0) {Response[i]='Good'}
  else {Response[i] = 'Bad'}
}
y = as.numeric(german$Result)
x <- as.matrix(german[,-16])
legend('topright',c('3등급','4등급','5등급','6등급','7등급','8등급','9등급'),col = mycol[7,6,5,4,3,2,1],pch=15)
attach(german)
model = glmnet(x[train,],y[train],family = 'binomial')
cv.out <- cv.glmnet(x[train,],y[train]) # 람다 값을 구하기 위해 x값과 y값을 넣어 cv데이터 셋
cv.out$lambda.min # cv데이터 셋에서 가장 작은 람다값을 구함
pred <- predict(model,newx=x[test,], s = cv.out$lambda.min)
predict(model,type='coefficients',newx=x[test],s=cv.out$lambda.min)

mean(pred-y[test])^2
