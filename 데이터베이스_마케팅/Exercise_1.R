# 데이터 불러 오기
install.packages('boot')
library(boot)
getwd()
setwd('C:/Users/User/Documents/GitHub/SNU_BDI/데이터베이스_마케팅')
RFM <- read.csv('mailorder.csv',header = TRUE)

# 0. 탐색적 분석
summary(RFM)
str(RFM)
dim(RFM)
cor(RFM[-c(1,2)])


# 0-1.범주형을 연속형으로 변환

RFM$gender = as.numeric(RFM$gender,levels = c('여성','남성'))

table(RFM$gender) # 여성이 1, 남성이 2

# 0-2. train & validation set 구분
RFM <- read.csv('mailorder.csv',header = TRUE)
RFM.train = RFM[1:2000,]
RFM.vali = RFM[2001:4000,]



# 1. Question 1.
RFM <- read.csv('mailorder.csv',header = TRUE)
RFM.train = RFM[1:2000,]
RFM.vali = RFM[2001:4000,]
set.seed(10)
Q1.result <- sample(RFM.vali$purchase,500)

mean(Q1.result) # 기준점이 되는 값 



# 2. Question 2.
RFM <- read.csv('mailorder.csv',header = TRUE)

# 2-1. 2*2*2로 R,F,M 나누기
RFM$recency2 <-  cut(RFM$recency, breaks = c(0,12,36),include.lowest = FALSE, right = TRUE,labels = c('2','1')) 
# 최근은 값이 낮을 수록 양의 상관관계이기 때문에 label을 c(2,1)
RFM$frequency2 <- cut(RFM$frequency,breaks = c(0,3,12),include.lowest = FALSE, right = TRUE,labels = c('1','2'))
RFM$monetary2 <- cut(RFM$monetary, breaks = c(0,209,478),include.lowest = FALSE, right = TRUE,labels = c('1','2'))
# 2-2. 각 그룹 별 기대 값
RFM.train = RFM[1:2000,]
RFM.vali = RFM[2001:4000,]
Q2.predict <- aggregate(formula = purchase ~ recency2+monetary2+frequency2,data = RFM.train,FUN = mean)
Q2.predict$predict222 <- Q2.predict$purchase 
Q2.predict <- Q2.predict[,-4]
RFM.vali = merge(x=RFM.vali,y=Q2.predict, by =c('recency2','monetary2','frequency2'),all.x = TRUE)
# 2-3. 전체 2000명중 상위 500명 뽑아내기
RFM.vali = arrange(RFM.vali,desc(predict222))
Q2_1 = RFM.vali[1:361,10]
Q2_2 = sample(RFM.vali[362:644,10],139)
Q2.result <- c(Q2_1,Q2_2)

# 2.4. 2*2*2 RFM 결과
mean(Q2.result)


# 3. Question 3
RFM <- read.csv('mailorder.csv',header = TRUE)
# 3-1. 5*5*5로 R,F,M 나누기
RFM$recency3 <-  cut(RFM$recency, breaks = c(0,4,8,12,16,36),include.lowest = FALSE, right = TRUE,labels = c('5','4','3','2','1'))
RFM$frequency3 <- cut(RFM$frequency,breaks = c(0,1,2,5,9,12),include.lowest = FALSE, right = TRUE,labels = c('1','2','3','4','5'))
RFM$monetary3 <- cut(RFM$monetary, breaks = c(0,113,181,242,299,478),include.lowest = FALSE, right = TRUE,labels = c('1','2','3','4','5'))
# 3-2 각 그룹 별 기대값
RFM.train = RFM[1:2000,]
RFM.vali = RFM[2001:4000,]
Q3.predict <- aggregate(formula = purchase ~ recency3+monetary3+frequency3,data = RFM.train,FUN = mean) # RFM 그룹 별 반응
Q3.predict$predict555 = Q3.predict$purchase # merge를 위한 전처리
Q3.predict = Q3.predict[,-4] # merge를 위한 전처리
RFM.vali = merge(x=RFM.vali,y=Q3.predict, by =c('recency3','monetary3','frequency3'),all.x = TRUE) #vali의 그룹 별 예측값 적용
# 3-3. 전체 2000명중 상위 500명 뽑아내기
RFM.vali = arrange(RFM.vali,desc(predict555))
Q3.result = RFM.vali[1:500,10]
# 3-4. 5*5*5 RFM 결과
mean(Q3.result)

# 4. Question 4.
RFM <- read.csv('mailorder.csv',header = TRUE)
RFM.train = RFM[1:2000,]
RFM.vali = RFM[2001:4000,]
# 4-1. 선형 회귀식
lm.fit <- lm(purchase~recency+monetary+frequency,data = RFM.train)
summary(lm.fit)
# 4-2. 각 관측 별 구매율
lm.predict <-predict(lm.fit,newdata = RFM.vali)
# 4-3. 전체 2000명 중 상위 500명 뽑아내기
result_Q4 <- tail(sort(lm.predict), n=500)
mean(result_Q4)





# 5. K-means 활용 RFM
# 2,3번의 RFM은 등급을 나누는데 있어서 적합하지 않음(5는 구간이 세밀해 그룹의 할당 관측치가 적음)
# 따라서 적당한 등급화를 위해 k-means를 활용함
library(NbClust)
RFM <- read.csv('mailorder.csv',header = TRUE)
RFM.train = RFM[1:2000,]
RFM.vali = RFM[2001:4000,]
set.seed(10)
# 5-1. 각 변수 별 클러스터링 갯수 파악하기
nc <- NbClust(RFM.train$recency, min.nc=2, max.nc=6, method="kmeans")
nc <- NbClust(RFM.train$frequency, min.nc=2, max.nc=6, method="kmeans")
nc <- NbClust(RFM.train$monetary, min.nc=2, max.nc=6, method="kmeans")


# 5-2 각 변수별 3등급으로클러스터링
recency.kmeans <- kmeans(RFM.train$recency, centers = 3, iter.max = 10000)
recency.kmeans <- recency.kmeans$cluster
frequency.kmeans <- kmeans(RFM.train$frequency, centers = 3, iter.max = 10000)
frequency.kmeans <- frequency.kmeans$cluster
monetary.kmeans <- kmeans(RFM.train$monetary, centers = 3, iter.max = 10000)
monetary.kmeans <- monetary.kmeans$cluster
RFM.train$recency.kmeans <- recency.kmeans
RFM.train$frequency.kmeas <- frequency.kmeans
RFM.train$monetary.kmeans <- monetary.kmeans

RFM.train <- data.frame(RFM.train,recency.kmeans,frequency.kmeans,monetary.kmeans)


recency.kmeans <- kmeans(RFM.vali$recency, centers = 3, iter.max = 10000)
recency.kmeans <- recency.kmeans$cluster
frequency.kmeans <- kmeans(RFM.vali$frequency, centers = 3, iter.max = 10000)
frequency.kmeans <- frequency.kmeans$cluster
monetary.kmeans <- kmeans(RFM.vali$monetary, centers = 3, iter.max = 10000)
monetary.kmeans <- monetary.kmeans$cluster
RFM.vali$recency.kmeans <- recency.kmeans
RFM.vali$frequency.kmeans <- frequency.kmeans
RFM.vali$monetary.kmeans <- monetary.kmeans

RFM.vali <- data.frame(RFM.vali,recency.kmeans,frequency.kmeans,monetary.kmeans)


Q5.predict <- aggregate(formula = purchase ~ recency.kmeans+monetary.kmeans+frequency.kmeans,data = RFM.train,FUN = mean)
Q5.predict$predict.kmeans = Q5.predict$purchase
Q5.predict = Q5.predict[,-4]


RFM.vali = merge(x=RFM.vali,y=Q5.predict, by =c('recency.kmeans','monetary.kmeans','frequency.kmeans'),all.x = TRUE)

RFM.vali = arrange(RFM.vali,desc(predict.kmeans))
Q5.result = RFM.vali[1:500,10]

mean(Q5.result)

#--------------------------------------------
summary(RFM)
cor(RFM[,-2],RFM[,-2])
str(RFM)
par(mfrow = c(1,1))



RFM_0 = RFM[RFM$purchase == 0,]
RFM_1 = RFM[RFM$purchase == 1,]

summary(RFM_0)
dim(RFM_0)
summary(RFM_1)
dim(RFM_1)

# 6. Regression 
# 변수 선택, 발전을 위한 

# lm
lm.fit1 <- glm(purchase~recency+monetary+frequency,data = RFM.train)
summary(lm.fit1)
mean(RFM.vali$purchase-predict(lm.fit1,RFM.vali)^2)

lm.fit2 <- glm(purchase~.,data = RFM.train)
summary(lm.fit2)
mean(RFM.vali$purchase-predict(lm.fit2,RFM.vali)^2)


# k-fold
set.seed(10)
RFM <- read.csv('mailorder.csv',header = TRUE)

RFM.train = RFM[1:2000,]
RFM.vali = RFM[2001:4000,]

lm.fit3 <- glm(purchase~recency+monetary+frequency,data = RFM.train)
ev.err <- cv.glm(RFM.vali,lm.fit3,K=20)$delta[1]
ev.err


# 전체 변수 선택 고려
install.packages('leaps')
library(leaps)
regfit.full <- regsubsets(purchase~.,RFM.vali)
summary(regfit.full)
reg.summary = summary(regfit.full)

names(reg.summary)
reg.summary$rsq
