german <- read.csv('german_numeric.csv',header=T)
names(german)
german_0 <- german[german$Result == 0,]
german_1 <- german[german$Result == 1,]

dim(german) # 자료구조, 사이즈를 알 수 있음 1000(행), 16(열,변수)
meann <- matrix(rep(0,32),2,16)
meann
for (i in 1:16) {
  meann[1,i] <- mean(german_0[,i])
  meann[2,i] <- mean(german_1[,i])
}
meann


summary(german)

library(class)
train <- c(1:600)
test <- c(601:1000)
german[,16] <- german[,16] -1

Response <- rep(0,1000) # vector를 만들때는 우선 사이즈를 만듬, 그 뒤 각 베터에 값을 지정
for (i in c(1:1000)){
  if (german[i,16]==0) {Response[i]="Good"} else {Response[i]="Bad"}
}



attach(german)
train.x <- german[train,-16]
test.x <- german[test,-16]
train.result <- Result[train]
test.result <- Result[test]

set.seed(1)
glm.fit=glm(Result~., data=german,family=binomial)


summary(glm.fit)
coef(glm.fit)

glm.probs = predict(glm.fit, type = 'response')
glm.probs[1:10]

glm.pred=rep('Good',1000)
glm.pred[glm.probs > 0.5]= 'Bad'

table(glm.pred,Response)
(137+629)/1000

library(MASS)
lda.fit = lda(Result~., data = german,subset = train)
lda.fit

library(MASS)
lda.fit = lda(Result ~., data = german, subset=train)
lda.fit

lda.pred = predict(lda.fit, newdata = test.x)
names(lda.pred)
lda.class = lda.pred$class
table(lda.class, test.result)


lda.pred = predict(lda.fit,test.x)
1/7
names(lda.pred)

qda.fit = qda(Result~.,data = german,subset = train)
qda.pred = predict(qda.fit,test.x)
qda.class = qda.pred$class
mean = qda.pred$class
