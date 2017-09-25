# 강의    교재 : introduce to statistical learning
# chapter 8 Lab: 트리 기반 방법 / p.381
#-------------------------------------------------
setwd("C:/Users/User/Documents/GitHub/SNU_BDI/데이터마이닝")
setwd("/Users/arnorfati/Documents/GitHub/SNU_BDI/데이터마이닝")
library(tree)
library(randomForest)
rm(list=ls())

# 8.3.1 분류 트리 적합
data("Carseats")
summary(Carseats)
dim(Carseats)
High = ifelse (Carseats$Sales <= 8, 'No','Yes')
Carseats = data.frame(Carseats,High)


# tree library를 통한 의사결정 나무
tree.carseats = tree(High~. -Sales,Carseats)
summary(tree.carseats)
plot(tree.carseats)
text(tree.carseats,pretty = 0)

tree.carseats

set.seed(2)
train = sample(1:nrow(Carseats),200)
test = !train

Carseats.test = Carseats[-train,]
High.test = High[-train]

tree.carseats = tree(High ~. -Sales, Carseats,subset=train)
tree.pred = predict(tree.carseats,Carseats.test,type='class')
table(tree.pred,High.test)
(96+57)/(96+27+30+57)

set.seed(3)
cv.carseats = cv.tree(tree.carseats,FUN=prune.misclass)
names(cv.carseats)

par(mfrow = c(1,2))
plot(cv.carseats$size, cv.carseats$dev,type = 'b')
plot(cv.carseats$k, cv.carseats$dev,type = 'b')

prune.carseats = prune.misclass(tree.carseats,best=9)
plot(prune.carseats)
text(prune.carseats,pretty = 0)

tree.pred = predict(prune.carseats,Carseats.test,type='class')
table(tree.pred,High.test)
(94+60)/(94+24+22+60)

# 8.3.3 Bagging & Random Forest
set.seed(2)
bag.boston = randomForest(medv~.,data=Boston,subset = train,mtry = 13,importance = TRUE)
bag.boston