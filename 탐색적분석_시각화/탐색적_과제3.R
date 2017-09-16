# 데이터 불러오기

setwd('C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
skilldata = read.csv('SkillCraft1_Dataset.csv')
wine_red = read.csv('winequality-red.csv')
wine_white = read.csv('winequality-white.csv',header = TRUE, sep = ';')

install.packages('dplyr')
library(dplyr)

summary(wine_white)
wine_white$quality <- as.integer(wine_white$quality)
cor(wine_white$volatile.acidity,wine_white$quality,method = 'spearman')
cor(wine_white$volatile.acidity,wine_white$quality)

str(wine_white)
str(quality)
wine_red$quality = quality
str(wine_red$quality)
cor(wine_red)
library(colorspace)
pal = choose_palette()
pal1 = c("#006D7E","#009E8F", "#00C994", "#28E88E", "#9DFC80", "#DDFF71", "#FFFE6D")
mycol = pal(7)
mycol
cor
summary(wine_red)
str(wine_red)

wine_white$quality = as.factor(wine_white$quality)
str(wine_white)
dim(wine_red)
cor(wine_red[,-12])
par(mfrow=c(1,1))
pairs(wine_white)
legend('topright',c('3등급','4등급','5등급','6등급','7등급','8등급','9등급'),col = mycol[7:1],pch=15)
table.white = table(wine_white$quality)
table.white = table(wine_white$quality)
bar.wine.white = barplot(table.white, ylim = c(0,2500), col = mycol[7:1])
text(bar.wine.white,cex=1.7,table.white+150, labels = paste(round(table.white, 2),"", sep=''))
legend()
barplot(table.white)
?barplot
# wine_ red
dim(wine_white)
wine_white_3 = wine_white[wine_white$quality == 3,]
wine_white_4 = wine_white[wine_white$quality == 4,]
wine_white_5 = wine_white[wine_white$quality == 5,]
wine_white_6 = wine_white[wine_white$quality == 6,]
wine_white_7 = wine_white[wine_white$quality == 7,]
wine_white_8 = wine_white[wine_white$quality == 8,]
wine_white_9 = wine_white[wine_white$quality == 9,]
## 레드와인의 특성을 등급별 비교
summary(wine_white)
# fixed acidity 뚜렷한 특성이 없음 
wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(fixed.acidity))
par(mfrow=c(1,1))

summary(wine_white$fixed.acidity)

summary(wine_white_9$fixed.acidity)
mycol
par(mfrow=c(4,1))

hist(wine_white_3$fixed.acidity,xlim = c(3.5,12),probability = TRUE,main = '3-Quality fixed.acidity',col = mycol[7])
hist(wine_white_4$fixed.acidity,xlim = c(3.5,12),probability = TRUE,main = '4-Quality fixed.acidity',col = mycol[6])
hist(wine_white_5$fixed.acidity,xlim = c(3.5,12),probability = TRUE,main = '5-Quality fixed.acidity',col = mycol[5])
hist(wine_white_6$fixed.acidity,xlim = c(3.5,12),probability = TRUE,main = '6-Quality fixed.acidity',col = mycol[4])
hist(wine_white_7$fixed.acidity,xlim = c(3.5,12),probability = TRUE,main = '7-Quality fixed.acidity',col = mycol[3])
hist(wine_white_8$fixed.acidity,xlim = c(3.5,12),probability = TRUE,main = '8-Quality fixed.acidity',col = mycol[2])
hist(wine_white_9$fixed.acidity,xlim = c(3.5,12),probability = TRUE,main = '8-Quality fixed.acidity',col = mycol[1])

summary(wine_white$volatile.acidity)
wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(volatile.acidity))
summary(wine_white$volatile.acidity)
hist(wine_white_3$volatile.acidity,xlim = c(0,1.0),probability = TRUE,main = '3-Quality volatile.acidity',col = mycol[7])
hist(wine_white_4$volatile.acidity,xlim = c(0,1.0),probability = TRUE,main = '4-Quality volatile.acidity',col = mycol[6])
hist(wine_white_5$volatile.acidity,xlim = c(0,1.0),probability = TRUE,main = '5-Quality volatile.acidity',col = mycol[5])
hist(wine_white_6$volatile.acidity,xlim = c(0,1.0),probability = TRUE,main = '6-Quality volatile.acidity',col = mycol[4])
hist(wine_white_7$volatile.acidity,xlim = c(0,1.0),probability = TRUE,main = '7-Quality volatile.acidity',col = mycol[3])
hist(wine_white_8$volatile.acidity,xlim = c(0,1.0),probability = TRUE,main = '8-Quality volatile.acidity',col = mycol[2])
hist(wine_white_9$volatile.acidity,xlim = c(0,1.0),probability = TRUE,main = '9-Quality volatile.acidity',col = mycol[1])
pal1 = c("#006D7E","#009E8F", "#00C994", "#28E88E", "#9DFC80", "#DDFF71", "#FFFE6D")

mycol = pal1

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(citric.acid))
summary(wine_white$citric.acid)
hist(wine_white_3$citric.acid,xlim = c(0,1),probability = TRUE,main = '3-Quality citric.acid',col = mycol[7])
hist(wine_white_4$citric.acid,xlim = c(0,1),probability = TRUE,main = '4-Quality citric.acid',col = mycol[6])
hist(wine_white_5$citric.acid,xlim = c(0,1),probability = TRUE,main = '5-Quality citric.acid',col = mycol[5])
hist(wine_white_6$citric.acid,xlim = c(0,1),probability = TRUE,main = '6-Quality citric.acid',col = mycol[4])
hist(wine_white_7$citric.acid,xlim = c(0,1),probability = TRUE,main = '7-Quality citric.acid',col = mycol[3])
hist(wine_white_8$citric.acid,xlim = c(0,1),probability = TRUE,main = '8-Quality citric.acid',col = mycol[2])
hist(wine_white_9$citric.acid,xlim = c(0,1),probability = TRUE,main = '9-Quality citric.acid',col = mycol[1])
wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(residual.sugar))
summary(wine_white$residual.sugar)
boxplot(wine_white$residual.sugar)
hist(wine_white_3$residual.sugar,xlim = c(0,20),probability = TRUE,main = '3-Quality residual.sugar',col = mycol[7])
hist(wine_white_4$residual.sugar,xlim = c(0,20),probability = TRUE,main = '4-Quality residual.sugar',col = mycol[6])
hist(wine_white_5$residual.sugar,xlim = c(0,20),probability = TRUE,main = '5-Quality residual.sugar',col = mycol[5])
hist(wine_white_6$residual.sugar,xlim = c(0,20),probability = TRUE,main = '6-Quality residual.sugar',col = mycol[4])
hist(wine_white_7$residual.sugar,xlim = c(0,20),probability = TRUE,main = '7-Quality residual.sugar',col = mycol[3])
hist(wine_white_8$residual.sugar,xlim = c(0,20),probability = TRUE,main = '8-Quality residual.sugar',col = mycol[2])
hist(wine_white_9$residual.sugar,xlim = c(0,20),probability = TRUE,main = '9-Quality residual.sugar',col = mycol[1])
wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(chlorides))
summary(wine_white$chlorides)
hist(wine_white_3$chlorides,xlim = c(0,0.25),probability = TRUE,main = '3-Quality chlorides',col = mycol[7])
hist(wine_white_4$chlorides,xlim = c(0,0.25),probability = TRUE,main = '4-Quality chlorides',col = mycol[6])
hist(wine_white_5$chlorides,xlim = c(0,0.25),probability = TRUE,main = '5-Quality chlorides',col = mycol[5])
hist(wine_white_6$chlorides,xlim = c(0,0.25),probability = TRUE,main = '6-Quality chlorides',col = mycol[4])
hist(wine_white_7$chlorides,xlim = c(0,0.25),probability = TRUE,main = '7-Quality chlorides',col = mycol[3])
hist(wine_white_8$chlorides,xlim = c(0,0.25),probability = TRUE,main = '8-Quality chlorides',col = mycol[2])
hist(wine_white_9$chlorides,xlim = c(0,0.25),probability = TRUE,main = '8-Quality chlorides',col = mycol[1])
wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(free.sulfur.dioxide))

summary(wine_white$free.sulfur.dioxide)
boxplot(wine_white$free.sulfur.dioxide)
hist(wine_white_3$free.sulfur.dioxide,xlim = c(0,100),probability = TRUE,main = '3-Quality free.sulfur.dioxide',col = mycol[7])
hist(wine_white_4$free.sulfur.dioxide,xlim = c(0,100),probability = TRUE,main = '4-Quality free.sulfur.dioxide',col = mycol[6])
hist(wine_white_5$free.sulfur.dioxide,xlim = c(0,100),probability = TRUE,main = '5-Quality free.sulfur.dioxide',col = mycol[5])
hist(wine_white_6$free.sulfur.dioxide,xlim = c(0,100),probability = TRUE,main = '6-Quality free.sulfur.dioxide',col = mycol[4])
hist(wine_white_7$free.sulfur.dioxide,xlim = c(0,100),probability = TRUE,main = '7-Quality free.sulfur.dioxide',col = mycol[3])
hist(wine_white_8$free.sulfur.dioxide,xlim = c(0,100),probability = TRUE,main = '8-Quality free.sulfur.dioxide',col = mycol[2])
hist(wine_white_9$free.sulfur.dioxide,xlim = c(0,100),probability = TRUE,main = '8-Quality free.sulfur.dioxide',col = mycol[1])

par(mfrow=c(4,1))

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(total.sulfur.dioxide))

summary(wine_white$total.sulfur.dioxide)
boxplot(wine_white$total.sulfur.dioxide)
hist(wine_white_3$total.sulfur.dioxide,xlim = c(9,300),probability = TRUE,main = '3-Quality total.sulfur.dioxide',col = mycol[7])
hist(wine_white_4$total.sulfur.dioxide,xlim = c(9,300),probability = TRUE,main = '4-Quality total.sulfur.dioxide',col = mycol[6])
hist(wine_white_5$total.sulfur.dioxide,xlim = c(9,300),probability = TRUE,main = '5-Quality total.sulfur.dioxide',col = mycol[5])
hist(wine_white_6$total.sulfur.dioxide,xlim = c(9,300),probability = TRUE,main = '6-Quality total.sulfur.dioxide',col = mycol[4])
hist(wine_white_7$total.sulfur.dioxide,xlim = c(9,300),probability = TRUE,main = '7-Quality total.sulfur.dioxide',col = mycol[3])
hist(wine_white_8$total.sulfur.dioxide,xlim = c(9,300),probability = TRUE,main = '8-Quality total.sulfur.dioxide',col = mycol[2])
hist(wine_white_9$total.sulfur.dioxide,xlim = c(9,300),probability = TRUE,main = '9-Quality total.sulfur.dioxide',col = mycol[1])
wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(density))
summary(wine_white$density)
boxplot(wine_white$density)
hist(wine_white_3$density,xlim = c(0.99,1.01),probability = TRUE,main = '3-Quality density',col = mycol[7])
hist(wine_white_4$density,xlim = c(0.99,1.01),probability = TRUE,main = '4-Quality density',col = mycol[6])
hist(wine_white_5$density,xlim = c(0.99,1.01),probability = TRUE,main = '5-Quality density',col = mycol[5])
hist(wine_white_6$density,xlim = c(0.99,1.01),probability = TRUE,main = '6-Quality density',col = mycol[4])
hist(wine_white_7$density,xlim = c(0.99,1.01),probability = TRUE,main = '7-Quality density',col = mycol[3])
hist(wine_white_8$density,xlim = c(0.99,1.01),probability = TRUE,main = '8-Quality density',col = mycol[2])
hist(wine_white_9$density,xlim = c(0.99,1.01),probability = TRUE,main = '9-Quality density',col = mycol[1])
?hist
wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(pH))
summary(wine_white$pH)
hist(wine_white_3$pH,xlim = c(2.7,3.82),probability = TRUE,main = '3-Quality pH',col = mycol[7])
hist(wine_white_4$pH,xlim = c(2.7,3.82),probability = TRUE,main = '4-Quality pH',col = mycol[6])
hist(wine_white_5$pH,xlim = c(2.7,3.82),probability = TRUE,main = '5-Quality pH',col = mycol[5])
hist(wine_white_6$pH,xlim = c(2.7,3.82),probability = TRUE,main = '6-Quality pH',col = mycol[4])
hist(wine_white_7$pH,xlim = c(2.7,3.82),probability = TRUE,main = '7-Quality pH',col = mycol[3])
hist(wine_white_8$pH,xlim = c(2.7,3.82),probability = TRUE,main = '8-Quality pH',col = mycol[2])
hist(wine_white_9$pH,xlim = c(2.7,3.82),probability = TRUE,main = '9-Quality pH',col = mycol[1])

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(sulphates))
summary(wine_white$sulphates)
boxplot(wine_white$sulphates)
hist(wine_white_3$sulphates,xlim = c(0.22,1),probability = TRUE,main = '3-Quality sulphates',col = mycol[7])
hist(wine_white_4$sulphates,xlim = c(0.22,1),probability = TRUE,main = '4-Quality sulphates',col = mycol[6])
hist(wine_white_5$sulphates,xlim = c(0.22,1),probability = TRUE,main = '5-Quality sulphates',col = mycol[5])
hist(wine_white_6$sulphates,xlim = c(0.22,1),probability = TRUE,main = '6-Quality sulphates',col = mycol[4])
hist(wine_white_7$sulphates,xlim = c(0.22,1),probability = TRUE,main = '7-Quality sulphates',col = mycol[3])
hist(wine_white_8$sulphates,xlim = c(0.22,1),probability = TRUE,main = '8-Quality sulphates',col = mycol[2])
hist(wine_white_9$sulphates,xlim = c(0.22,1),probability = TRUE,main = '9-Quality sulphates',col = mycol[1])

b <- wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(alcohol))
summary(wine_white$alcohol)
hist(wine_white_3$alcohol,xlim = c(8,15),probability = TRUE,main = '3-Quality alcohol',col = mycol[7])
hist(wine_white_4$alcohol,xlim = c(8,15),probability = TRUE,main = '4-Quality alcohol',col = mycol[6])
hist(wine_white_5$alcohol,xlim = c(8,15),probability = TRUE,main = '5-Quality alcohol',col = mycol[5])
hist(wine_white_6$alcohol,xlim = c(8,15),probability = TRUE,main = '6-Quality alcohol',col = mycol[4])
hist(wine_white_7$alcohol,xlim = c(8,15),probability = TRUE,main = '7-Quality alcohol',col = mycol[3])
hist(wine_white_8$alcohol,xlim = c(8,15),probability = TRUE,main = '8-Quality alcohol',col = mycol[2])
hist(wine_white_9$alcohol,xlim = c(8,15),probability = TRUE,main = '9-Quality alcohol',col = mycol[1])


# wine_ white
write.csv(b,'b.csv')
b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(fixed.acidity))

b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(volatile.acidity))

b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(citric.acid))

b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(residual.sugar))

b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(chlorides))

b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(free.sulfur.dioxide))

b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(total.sulfur.dioxide))
#

b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(density))

b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(pH))

b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(sulphates))

b <-wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(alcohol))



str(wine_white)
str(wine_white)
str(wine_white$quality)
summary(wine_white)
# skilldata
summary(wine_white)
summary(wine_white)
write.csv(a,'a.csv')
