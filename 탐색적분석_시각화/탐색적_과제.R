# 데이터 불러오기1

setwd('C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
setwd('/Users/arnorfati/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
skilldata = read.csv('SkillCraft1_Dataset.csv',stringsAsFactors = F, na.strings = c('?'))
colSums(is.na(skilldata))
library(dplyr)                    

# 전처리

#---------------------------------------------------------------------#
# skilldata
summary(skilldata)
table_League = table(skilldata$LeagueIndex)
table.name = c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro')
bar.a = barplot(table_League,ylim = c(0,1000), main = 'LeagueIndex',names.arg = table.name,col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'))
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)
text(bar.a,cex=1.7,table_League+100, labels = paste(round(table_League, 2),"", sep=''))
mycol = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue')
mycol = colors()
plot(1:80, y=rep(1,80), col = mycol[1:80], cex = 2, pch = 20, 
     ylim = c(0,1) )
points(1:80, y=rep(0.5,80), col = mycol[81:160], cex = 2, pch = 20 )
points(1:80, y=rep(0,80), col = mycol[161:240], cex = 2, pch = 20 )
install.packages('colorspace')
library(colorspace)
pal = choose_palette()

str(skilldata)
skilldata$LeagueIndex = factor(skilldata$LeagueIndex,ordered = TRUE)
str
detach(skilldata)
attach(skilldata)
summary(skilldata)
hist(LeagueIndex,breaks = 8)
pie(LeagueIndex)
boxplot(Age) # 이상값 다수 존재 
hist(HoursPerWeek)
boxplot(TotalHours)
summary(skilldata)
which.max(skilldata$TotalHours)
skilldata[1794,5] = 25000
mean(TotalHours,na.rm = T)
which.max(TotalHours)
skilldata[1794,5]
TotalHours
skilldata$TotalHours[1794] = 25000
plot(HoursPerWeek)
24*7


#Age
# 큰 차이는 없음 프로선수 데이터 활용 채워 넣기
pro <- c(21,	25,	21,	23,	26,	23,	26,	25,	23,	24,	25,	22,	22,	22,	25,	25,	23,	23,	24,	21,	25,	23,	22,	23,	24,	22,	20,	23,	23,	20,	23,	21,	25,	22,	25,	25,	25,	23,	20,	24,	25,	22,	25,	24,	17,	22,	22,	20,	27,	27,	24,	25,	27,	28,	19,	27,	19,	24,	27,	25,	21,	23,	23,	20,	24,	22,	23,	21,	20,	25)
a <- mean(pro)
b <- sd(pro)
?rnorm()
rnorm
a <- rnorm(55,a,b)
mean(a)
a <- as.integer(a)
skilldata[skilldata$LeagueIndex == 8,]$Age = a
plot(skilldata$LeagueIndex,boxplot(skilldata$Age))
boxplot(TotalHours ~ LeagueIndex,data=skilldata_0,names.arg = table.name,col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue') )
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)
skilldata_0 <- skilldata[-c(2325,1797,771,1979,2217,1794,3254,2217,8,2141,11),]
dim(skilldata_0)
dim(skilldata)
#HourPerWeek
# 설문을 통한 데이터인듯
#TotalHour
# 설문을 통한 데이터인듯
cor(skilldata, na.rm = TRUE)
#AMP
hist(APM)
plot(density(skilldata$APM),type = 'b',ylim = c(0,0.022))
hist(skilldata$APM,breaks = 16,probability = TRUE,ylim = c(0,0.022))
lines(density(skilldata_1$APM), col = mycol[1],lwd = 2)
lines(density(skilldata_2$APM), col = mycol[2],lwd = 2)
lines(density(skilldata_3$APM), col = mycol[3],lwd = 2)
lines(density(skilldata_4$APM), col = mycol[4],lwd = 2)
lines(density(skilldata_5$APM), col = mycol[5],lwd = 2)
lines(density(skilldata_6$APM), col = mycol[6],lwd = 2)
lines(density(skilldata_7$APM), col = mycol[7],lwd = 2)
lines(density(skilldata_8$APM), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)

str(skilldata$APM)
a <- skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_APM = mean(APM, na.rm = TRUE))

cor(skilldata$LeagueIndex,skilldata$APM,method = 'spearman')


#SelectByHotkeys
str(skilldata$SelectByHotkeys)

write.csv(b,'b.csv')

b<- skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_GBP = mean(GapBetweenPACs, na.rm = TRUE))



summary(HoursPerWeek)
plot(HoursPerWeek,TotalHours)
which.max(HoursPerWeek)
skilldata[691,]

cor(GapBetweenPACs,LeagueIndex)
#------------데이터 분류 ----------------------------
skilldata_1 = skilldata[skilldata$LeagueIndex == 1,]
skilldata_2 = skilldata[skilldata$LeagueIndex == 2,]
skilldata_3 = skilldata[skilldata$LeagueIndex == 3,]
skilldata_4 = skilldata[skilldata$LeagueIndex == 4,]
skilldata_5 = skilldata[skilldata$LeagueIndex == 5,]
skilldata_6 = skilldata[skilldata$LeagueIndex == 6,]
skilldata_7 = skilldata[skilldata$LeagueIndex == 7,]
skilldata_8 = skilldata[skilldata$LeagueIndex == 8,]
plot(LeagueIndex,TotalHours)
summary(skilldata_1)
summary(skilldata_2)
head(skilldata_1)
dim(skilldata_1)
dim(skilldata_2)
dim(skilldata_3)
dim(skilldata_4)
dim(skilldata_5)
dim(skilldata_6)
dim(skilldata_7)
dim(skilldata_8)

hist(skilldata_8$GapBetweenPACs)

install.packages('randomForest')
library(randomForest)
