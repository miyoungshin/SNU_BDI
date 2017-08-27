set.seed(1)
x1 <- runif(100)
x2 <- 0.5*x1+rnorm(100)/10
y <- 2 + 2*x1+0.3*x2+rnorm(100)
lm(y~x1+x2)
cor(x1,x2)
plot(x1,x2)
summary(lm(y~x1+x2))
cor.test(x1,x2)
plot(x1~x2)
plot(x1)
plot(x2)
boxplot(x1)
boxplot(x2)
summary(lm(y~x1))
plot()
summary(lm(y~x2))
x1 <- c(x1,0.1)
x2 <- c(x2,0.8)
y <- c(y,6)
lm.fit <- lm(y~x1+x2)
plot(lm.fit)
1
plot(x1)
plot(x2)

x1 = 4.0
x2 = 110
x3 = 1
x4 = 4.0*110
x5 = 1*4.0
y <- 50+20*x1+0.07*x2+35*x3+0.01*x4+(-10)*x5


library(ISLR)
attach(Smarket)
str(Smarket)
?Smarket
head(Smarket)
cor(Smarket[,-9])
attach(Smarket)
glm.fit <- glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Smarket,family=binomial)


# glm을 사용해서 logistic을 사용하려면 binomial을 조건값으로 줘야 함
glm.prob <- predict.glm(glm.fit,type = 'response') # 0과 1사이의 값으로 나옴
glm.prob
glm.pred <- rep('Down',1250)
glm.pred[glm.prob >0.5] = 'Up'
table(glm.pred,Smarket$Direction)
(145+507)/length(glm.pred)

train = (Year<2005)
Smarket.2005=Smarket[!train,]
Direction.2005<-Direction[!train]
glm.fit=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Smarket,subset=train,family="binomial")
glm.prob=predict(glm.fit,Smarket.2005,type="response")

glm.pred=rep("Down",252)
glm.pred[glm.prob>0.5]="Up"
table(glm.pred,Direction.2005)

# lda도 logstic과 거의 비슷하다, logistic이 더 유연함
library(MASS)
lda.fit=lda(Direction~Lag1+Lag2,data=Smarket,subset=train)
lda.fit

head(Weekly)
str(Weekly)
glm.fit <- glm()

