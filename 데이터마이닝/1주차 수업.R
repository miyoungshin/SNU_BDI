# 강의 교재 introduce to statistical learning
install.packages("ISLR") # 강의 관련 데이터를 받을 수 있는 패키지
library(ISLR)
# http://www-bcf.usc.edu/~gareth/ISL/data.html 접속 
# 후 Advertising.csv, credit.csv 파일 지정 디렉토리에 저장
# chpter2 Statistical Learning은 스스로 읽어보기
# 강의 내용과 교재는 거의 유사, 강의 후 교재를 통해 디테일을 복습
# 회귀분석(단순회귀,중회귀, 교호작용, 모형진단)
setwd("C:/Users/User/Desktop/데이터마이닝")
adver <- read.csv("Advertising.csv",header=T)
head(adver)
lm.fit <- lm(Sales~., data = adver)
summary(lm.fit)
attach(adver)
lmout <- lm(Sales~TV)
summary(lmout)
est=lmout$coef
est
resid = lmout$resid
resid
anova(lm.fit)
anova(lm.fit,type='type2')
? anova
step()

credit <- read.csv("Credit.csv",header=T)
