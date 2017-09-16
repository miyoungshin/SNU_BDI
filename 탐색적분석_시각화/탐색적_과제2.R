# 데이터 불러오기

setwd('C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
skilldata = read.csv('SkillCraft1_Dataset.csv')
wine_red = read.csv('winequality-red.csv')
wine_white = read.csv('winequality-white.csv',header = TRUE, sep = ';')

install.packages('dplyr')
library(dplyr)

summary(wine_red)
wine_red$quality <- as.integer(wine_red$quality)
str(wine_red)
str(quality)
wine_red$quality = quality
str(wine_red$quality)
cor(wine_red)
library(colorspace)
pal = choose_palette()

mycol = pal(6)
mycol
cor
summary(wine_red)
str(wine_red)

wine_white$quality = as.factor(wine_white$quality)
str(wine_white)
dim(wine_red)
cor(wine_red[,-12])
par(mfrow=c(1,1))
table.red = table(wine_red$quality)
table.white = table(wine_white$quality)
bar.wine.red = barplot(table.red, ylim = c(0,800), col = mycol[6:1])
text(bar.wine.red,cex=1.7,table.red+100, labels = paste(round(table.red, 2),"", sep=''))
legend('topright',c('3등급','4등급','5등급','6등급','7등급','8등급'),col = mycol[6:1],pch=15)
mycol = c("#8E063B","#C05E4F","#E4945E","#F5BE6C","#F3DB7E","#E2E6BD")
dim(wine_red)
barplot(table.white)
?barplot
mycol = c("#8E063B","#C05E4F","#E4945E","#F5BE6C","#F3DB7E","#E2E6BD")
# wine_ red
dim(wine_red_3)
wine_red_3 = wine_red[wine_red$quality == 3,]
wine_red_4 = wine_red[wine_red$quality == 4,]
wine_red_5 = wine_red[wine_red$quality == 5,]
wine_red_6 = wine_red[wine_red$quality == 6,]
wine_red_7 = wine_red[wine_red$quality == 7,]
wine_red_8 = wine_red[wine_red$quality == 8,]

## 레드와인의 특성을 등급별 비교

# fixed acidity 뚜렷한 특성이 없음 
wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(fixed.acidity))
par(mfrow=c(1,1))
hist(wine_red_3$fixed.acidity,xlim = c(4,16),probability = TRUE,type = 'n')
lines(density(wine_red_3$fixed.acidity),lwd = 2)
lines(density(wine_red_4$fixed.acidity),lwd = 2)
lines(density(wine_red_5$fixed.acidity),lwd = 2)
lines(density(wine_red_6$fixed.acidity),lwd = 2)
lines(density(wine_red_7$fixed.acidity),lwd = 2)
lines(density(wine_red_8$fixed.acidity),lwd = 2)

mycol
par(mfrow=c(4,1))

hist(wine_red_3$fixed.acidity,xlim = c(4,16),probability = TRUE,main = '3-Quality fixed.acidity',col = mycol[6])
hist(wine_red_4$fixed.acidity,xlim = c(4,16),probability = TRUE,main = '4-Quality fixed.acidity',col = mycol[5])
hist(wine_red_5$fixed.acidity,xlim = c(4,16),probability = TRUE,main = '5-Quality fixed.acidity',col = mycol[4])
hist(wine_red_6$fixed.acidity,xlim = c(4,16),probability = TRUE,main = '6-Quality fixed.acidity',col = mycol[3])
hist(wine_red_7$fixed.acidity,xlim = c(4,16),probability = TRUE,main = '7-Quality fixed.acidity',col = mycol[2])
hist(wine_red_8$fixed.acidity,xlim = c(4,16),probability = TRUE,main = '8-Quality fixed.acidity',col = mycol[1])


summary(wine_red$volatile.acidity)
wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(volatile.acidity))
summary(wine_red$volatile.acidity)
hist(wine_red_3$volatile.acidity,xlim = c(0,1.6),probability = TRUE,main = '3-Quality volatile.acidity',col = mycol[6])
hist(wine_red_4$volatile.acidity,xlim = c(0,1.6),probability = TRUE,main = '4-Quality volatile.acidity',col = mycol[5])
hist(wine_red_5$volatile.acidity,xlim = c(0,1.6),probability = TRUE,main = '5-Quality volatile.acidity',col = mycol[4])
hist(wine_red_6$volatile.acidity,xlim = c(0,1.6),probability = TRUE,main = '6-Quality volatile.acidity',col = mycol[3])
hist(wine_red_7$volatile.acidity,xlim = c(0,1.6),probability = TRUE,main = '7-Quality volatile.acidity',col = mycol[2])
hist(wine_red_8$volatile.acidity,xlim = c(0,1.6),probability = TRUE,main = '8-Quality volatile.acidity',col = mycol[1])





wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(citric.acid))
summary(wine_red$citric.acid)
hist(wine_red_3$citric.acid,xlim = c(0,1),probability = TRUE,main = '3-Quality citric.acid',col = mycol[6])
hist(wine_red_4$citric.acid,xlim = c(0,1),probability = TRUE,main = '4-Quality citric.acid',col = mycol[5])
hist(wine_red_5$citric.acid,xlim = c(0,1),probability = TRUE,main = '5-Quality citric.acid',col = mycol[4])
hist(wine_red_6$citric.acid,xlim = c(0,1),probability = TRUE,main = '6-Quality citric.acid',col = mycol[3])
hist(wine_red_7$citric.acid,xlim = c(0,1),probability = TRUE,main = '7-Quality citric.acid',col = mycol[2])
hist(wine_red_8$citric.acid,xlim = c(0,1),probability = TRUE,main = '8-Quality citric.acid',col = mycol[1])

wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(residual.sugar))
summary(wine_red$residual.sugar)
hist(wine_red_3$residual.sugar,xlim = c(0,12),probability = TRUE,main = '3-Quality residual.sugar',col = mycol[6])
hist(wine_red_4$residual.sugar,xlim = c(0,12),probability = TRUE,main = '4-Quality residual.sugar',col = mycol[5])
hist(wine_red_5$residual.sugar,xlim = c(0,12),probability = TRUE,main = '5-Quality residual.sugar',col = mycol[4])
hist(wine_red_6$residual.sugar,xlim = c(0,12),probability = TRUE,main = '6-Quality residual.sugar',col = mycol[3])
hist(wine_red_7$residual.sugar,xlim = c(0,12),probability = TRUE,main = '7-Quality residual.sugar',col = mycol[2])
hist(wine_red_8$residual.sugar,xlim = c(0,12),probability = TRUE,main = '8-Quality residual.sugar',col = mycol[1])

wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(chlorides))
summary(wine_red$chlorides)
hist(wine_red_3$chlorides,xlim = c(0,0.5),probability = TRUE,main = '3-Quality chlorides',col = mycol[6])
hist(wine_red_4$chlorides,xlim = c(0,0.5),probability = TRUE,main = '4-Quality chlorides',col = mycol[5])
hist(wine_red_5$chlorides,xlim = c(0,0.5),probability = TRUE,main = '5-Quality chlorides',col = mycol[4])
hist(wine_red_6$chlorides,xlim = c(0,0.5),probability = TRUE,main = '6-Quality chlorides',col = mycol[3])
hist(wine_red_7$chlorides,xlim = c(0,0.5),probability = TRUE,main = '7-Quality chlorides',col = mycol[2])
hist(wine_red_8$chlorides,xlim = c(0,0.5),probability = TRUE,main = '8-Quality chlorides',col = mycol[1])

wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(free.sulfur.dioxide))

summary(wine_red$free.sulfur.dioxide)
hist(wine_red_3$free.sulfur.dioxide,xlim = c(0,72),probability = TRUE,main = '3-Quality free.sulfur.dioxide',col = mycol[6])
hist(wine_red_4$free.sulfur.dioxide,xlim = c(0,72),probability = TRUE,main = '4-Quality free.sulfur.dioxide',col = mycol[5])
hist(wine_red_5$free.sulfur.dioxide,xlim = c(0,72),probability = TRUE,main = '5-Quality free.sulfur.dioxide',col = mycol[4])
hist(wine_red_6$free.sulfur.dioxide,xlim = c(0,72),probability = TRUE,main = '6-Quality free.sulfur.dioxide',col = mycol[3])
hist(wine_red_7$free.sulfur.dioxide,xlim = c(0,72),probability = TRUE,main = '7-Quality free.sulfur.dioxide',col = mycol[2])
hist(wine_red_8$free.sulfur.dioxide,xlim = c(0,72),probability = TRUE,main = '8-Quality free.sulfur.dioxide',col = mycol[1])
par(mfrow=c(4,1))

wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(total.sulfur.dioxide))

summary(wine_red$total.sulfur.dioxide)
hist(wine_red_3$total.sulfur.dioxide,xlim = c(6,280),probability = TRUE,main = '3-Quality total.sulfur.dioxide',col = mycol[6])
hist(wine_red_4$total.sulfur.dioxide,xlim = c(6,280),probability = TRUE,main = '4-Quality total.sulfur.dioxide',col = mycol[5])
hist(wine_red_5$total.sulfur.dioxide,xlim = c(6,280),probability = TRUE,main = '5-Quality total.sulfur.dioxide',col = mycol[4])
hist(wine_red_6$total.sulfur.dioxide,xlim = c(6,280),probability = TRUE,main = '6-Quality total.sulfur.dioxide',col = mycol[3])
hist(wine_red_7$total.sulfur.dioxide,xlim = c(6,280),probability = TRUE,main = '7-Quality total.sulfur.dioxide',col = mycol[2])
hist(wine_red_8$total.sulfur.dioxide,xlim = c(6,280),probability = TRUE,main = '8-Quality total.sulfur.dioxide',col = mycol[1])

wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(density))
summary(wine_red$density)
hist(wine_red_3$density,xlim = c(0.99,1.004),probability = TRUE,main = '3-Quality density',col = mycol[6])
hist(wine_red_4$density,xlim = c(0.99,1.004),probability = TRUE,main = '4-Quality density',col = mycol[5])
hist(wine_red_5$density,xlim = c(0.99,1.004),probability = TRUE,main = '5-Quality density',col = mycol[4])
hist(wine_red_6$density,xlim = c(0.99,1.004),probability = TRUE,main = '6-Quality density',col = mycol[3])
hist(wine_red_7$density,xlim = c(0.99,1.004),probability = TRUE,main = '7-Quality density',col = mycol[2])
hist(wine_red_8$density,xlim = c(0.99,1.004),probability = TRUE,main = '8-Quality density',col = mycol[1])

wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(pH))
summary(wine_red$pH)
hist(wine_red_3$pH,xlim = c(2.7,4.01),probability = TRUE,main = '3-Quality pH',col = mycol[6])
hist(wine_red_4$pH,xlim = c(2.7,4.01),probability = TRUE,main = '4-Quality pH',col = mycol[5])
hist(wine_red_5$pH,xlim = c(2.7,4.01),probability = TRUE,main = '5-Quality pH',col = mycol[4])
hist(wine_red_6$pH,xlim = c(2.7,4.01),probability = TRUE,main = '6-Quality pH',col = mycol[3])
hist(wine_red_7$pH,xlim = c(2.7,4.01),probability = TRUE,main = '7-Quality pH',col = mycol[2])
hist(wine_red_8$pH,xlim = c(2.7,4.01),probability = TRUE,main = '8-Quality pH',col = mycol[1])

wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(sulphates))
summary(wine_red$sulphates)
hist(wine_red_3$sulphates,xlim = c(0.3,2),probability = TRUE,main = '3-Quality sulphates',col = mycol[6])
hist(wine_red_4$sulphates,xlim = c(0.3,2),probability = TRUE,main = '4-Quality sulphates',col = mycol[5])
hist(wine_red_5$sulphates,xlim = c(0.3,2),probability = TRUE,main = '5-Quality sulphates',col = mycol[4])
hist(wine_red_6$sulphates,xlim = c(0.3,2),probability = TRUE,main = '6-Quality sulphates',col = mycol[3])
hist(wine_red_7$sulphates,xlim = c(0.3,2),probability = TRUE,main = '7-Quality sulphates',col = mycol[2])
hist(wine_red_8$sulphates,xlim = c(0.3,2),probability = TRUE,main = '8-Quality sulphates',col = mycol[1])

b <- wine_red %>%
  group_by(quality) %>%
  summarize(mean = mean(alcohol))
summary(wine_red$alcohol)
hist(wine_red_3$alcohol,xlim = c(8,15),probability = TRUE,main = '3-Quality alcohol',col = mycol[6])
hist(wine_red_4$alcohol,xlim = c(8,15),probability = TRUE,main = '4-Quality alcohol',col = mycol[5])
hist(wine_red_5$alcohol,xlim = c(8,15),probability = TRUE,main = '5-Quality alcohol',col = mycol[4])
hist(wine_red_6$alcohol,xlim = c(8,15),probability = TRUE,main = '6-Quality alcohol',col = mycol[3])
hist(wine_red_7$alcohol,xlim = c(8,15),probability = TRUE,main = '7-Quality alcohol',col = mycol[2])
hist(wine_red_8$alcohol,xlim = c(8,15),probability = TRUE,main = '8-Quality alcohol',col = mycol[1])


# wine_ white

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(fixed.acidity))

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(volatile.acidity))

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(citric.acid))

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(residual.sugar))

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(chlorides))

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(free.sulfur.dioxide))

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(total.sulfur.dioxide))
#

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(density))

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(pH))

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(sulphates))

wine_white %>%
  group_by(quality) %>%
  summarize(mean = mean(alcohol))



str(wine_red)
str(wine_white)
str(wine_red$quality)
summary(wine_red)
# skilldata
summary(wine_red)
summary(wine_white)
write.csv(a,'a.csv')
