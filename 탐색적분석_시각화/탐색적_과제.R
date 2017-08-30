# 데이터 불러오기

setwd('C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
setwd('/Users/arnorfati/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
skilldata = read.csv('SkillCraft1_Dataset.csv',stringsAsFactors = F, na.strings = c('?'))
colSums(is.na(skilldata))
install.packages('dplyr')
library(dplyr)                    

wine_red = read.csv('winequality-red.csv')
wine_white = read.csv('winequality-white.csv')
#---------------------------------------------------------------------#
# skilldata
summary(skilldata)
table_League = table(skilldata$LeagueIndex)
table.name = c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro')
barplot(table_League, main = 'LeagueIndex',names.arg = table.name,col = c('saddle brown','Azure 3','gold3','light cyan','alice blue','light sky blue',' royal blue','midnight blue'))
mycol = colors()
plot(1:80, y=rep(1,80), col = mycol[1:80], cex = 2, pch = 20, 
     ylim = c(0,1) )
points(1:80, y=rep(0.5,80), col = mycol[81:160], cex = 2, pch = 20 )
points(1:80, y=rep(0,80), col = mycol[161:240], cex = 2, pch = 20 )
install.packages('colorspace')
library(colorspace)
pal = choose_palette()

str(skilldata)
skilldata$LeagueIndex = as.factor(skilldata$LeagueIndex)
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
TotalHours[1794] = 25000
plot(HoursPerWeek)
24*7


#Age
# 큰 차이는 없음 프로선수 데이터 활용 채워 넣기

#HourPerWeek
# 설문을 통한 데이터인듯
#TotalHour
# 설문을 통한 데이터인듯

#AMP
hist(APM)
plot(APM~LeagueIndex)
str(skilldata$APM)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_APM = mean(APM, na.rm = TRUE))

cor(LeagueIndex,APM)


#SelectByHotkeys
str(skilldata$SelectByHotkeys)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_SBH = mean(SelectByHotkeys, na.rm = TRUE))

plot(SelectByHotkeys~LeagueIndex)
cor(LeagueIndex,SelectByHotkeys)
summary(SelectByHotkeys) # 등급별 평균 확인하기

#AssignToHotkeys
str(skilldata$AssignToHotkeys)

skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_ATH = mean(AssignToHotkeys, na.rm = TRUE))

plot(AssignToHotkeys,SelectByHotkeys)
cor.test(AssignToHotkeys,SelectByHotkeys)
cor(skilldata)

hist(skilldata$AssignToHotkeys)

#UniqueHotkeys
str(skilldata$UniqueHotkeys)

skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_UHK = mean(UniqueHotkeys, na.rm = TRUE))
summary(skilldata)

#MinimapAttacks
str(skilldata$MinimapAttacks)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_MA = mean(MinimapAttacks, na.rm = TRUE))


#MinimapRightClicks
str(skilldata$MinimapRightClicks)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_MRA = mean(MinimapRightClicks, na.rm = TRUE))

#NumberOfPACs
str(skilldata$NumberOfPACs)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_NOP = mean(NumberOfPACs, na.rm = TRUE))


#GapBetweenPACs
str(skilldata$GapBetweenPACs)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_GBP = mean(GapBetweenPACs, na.rm = TRUE))

hist(skilldata_1$GapBetweenPACs,xlim=c(0,200),col = c('saddle brown'))
hist(skilldata_2$GapBetweenPACs,xlim=c(0,200))
hist(skilldata_3$GapBetweenPACs,xlim=c(0,200))
hist(skilldata_4$GapBetweenPACs,xlim=c(0,200))
hist(skilldata_5$GapBetweenPACs,xlim=c(0,200))
hist(skilldata_6$GapBetweenPACs,xlim=c(0,200))
hist(skilldata_6$GapBetweenPACs,xlim=c(0,200))
hist(skilldata_8$GapBetweenPACs,xlim=c(0,200))
#ActionLatency
str(skilldata$ActionLatency)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_AL = mean(ActionLatency, na.rm = TRUE))

#ActionsInPAC
str(skilldata$ActionsInPAC)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_AIP = mean(ActionsInPAC, na.rm = TRUE))

#TotalMapExplored
str(skilldata$TotalMapExplored)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_TME = mean(TotalMapExplored, na.rm = TRUE))
# 프로씬은 맵확인을 많이 하지 않음

#WorkersMade
str(skilldata$WorkersMade)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_WM = mean(WorkersMade, na.rm = TRUE))
par(mfrow=c(4,1))
hist(skilldata_1$WorkersMade,xlim=c(0.0005,0.0025),col = c('saddle brown'))
hist(skilldata_2$WorkersMade,xlim=c(0.0005,0.0025),col = c('Azure 3'))
hist(skilldata_3$WorkersMade,xlim=c(0.0005,0.0025),col = c('gold3'))
hist(skilldata_4$WorkersMade,xlim=c(0.0005,0.0025),col = c('light cyan'))
hist(skilldata_5$WorkersMade,xlim=c(0.0005,0.0025),col = c('alice blue'))
hist(skilldata_6$WorkersMade,xlim=c(0.0005,0.0025),col = c('light sky blue'))
hist(skilldata_6$WorkersMade,xlim=c(0.0005,0.0025),col = c('royal blue'))
hist(skilldata_8$WorkersMade,xlim=c(0.0005,0.0025),col = c('midnight blue'))

#UniqueUnitsMade
str(skilldata$UniqueUnitsMade)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_UUM = mean(UniqueUnitsMade, na.rm = TRUE))

#ComplexUnitsMade
str(skilldata$ComplexUnitsMade)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_CUM = mean(ComplexUnitsMade, na.rm = TRUE))

#ComplexAbilitiesUsed
str(skilldata$UniqueHotkeys)
skilldata %>%
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
