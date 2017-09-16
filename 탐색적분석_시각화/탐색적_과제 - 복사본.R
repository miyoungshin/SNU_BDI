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
TotalHours[1794] = 25000
plot(HoursPerWeek)
24*7


#Age
# 큰 차이는 없음 프로선수 데이터 활용 채워 넣기
pro <- c(21,	25,	21,	23,	26,	23,	26,	25,	23,	24,	25,	22,	22,	22,	25,	25,	23,	23,	24,	21,	25,	23,	22,	23,	24,	22,	20,	23,	23,	20,	23,	21,	25,	22,	25,	25,	25,	23,	20,	24,	25,	22,	25,	24,	17,	22,	22,	20,	27,	27,	24,	25,	27,	28,	19,	27,	19,	24,	27,	25,	21,	23,	23,	20,	24,	22,	23,	21,	20,	25)
#HourPerWeek
# 설문을 통한 데이터인듯
#TotalHour
# 설문을 통한 데이터인듯

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
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_APM = mean(APM, na.rm = TRUE))

cor(skilldata$LeagueIndex,skilldata$APM,method = 'spearman')


#SelectByHotkeys
str(skilldata$SelectByHotkeys)
skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_SBH = mean(SelectByHotkeys, na.rm = TRUE))

hist(skilldata$SelectByHotkeys,breaks = 16,ylim = c(0,600),probability = TRUE)
lines(density(skilldata_1$SelectByHotkeys), col = mycol[1],lwd = 2)
lines(density(skilldata_2$SelectByHotkeys), col = mycol[2],lwd = 2)
lines(density(skilldata_3$SelectByHotkeys), col = mycol[3],lwd = 2)
lines(density(skilldata_4$SelectByHotkeys), col = mycol[4],lwd = 2)
lines(density(skilldata_5$SelectByHotkeys), col = mycol[5],lwd = 2)
lines(density(skilldata_6$SelectByHotkeys), col = mycol[6],lwd = 2)
lines(density(skilldata_7$SelectByHotkeys), col = mycol[7],lwd = 2)
lines(density(skilldata_8$SelectByHotkeys), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


cor(LeagueIndex,SelectByHotkeys)
summary(SelectByHotkeys) # 등급별 평균 확인하기

#AssignToHotkeys
str(skilldata$AssignToHotkeys)
hist(skilldata$AssignToHotkeys,breaks = 16,ylim = c(0,4000),probability = TRUE)
lines(density(skilldata_1$AssignToHotkeys), col = mycol[1],lwd = 2)
lines(density(skilldata_2$AssignToHotkeys), col = mycol[2],lwd = 2)
lines(density(skilldata_3$AssignToHotkeys), col = mycol[3],lwd = 2)
lines(density(skilldata_4$AssignToHotkeys), col = mycol[4],lwd = 2)
lines(density(skilldata_5$AssignToHotkeys), col = mycol[5],lwd = 2)
lines(density(skilldata_6$AssignToHotkeys), col = mycol[6],lwd = 2)
lines(density(skilldata_7$AssignToHotkeys), col = mycol[7],lwd = 2)
lines(density(skilldata_8$AssignToHotkeys), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)



skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_ATH = mean(AssignToHotkeys, na.rm = TRUE))

plot(AssignToHotkeys,SelectByHotkeys)
cor.test(AssignToHotkeys,SelectByHotkeys)
cor(skilldata)

hist(skilldata$AssignToHotkeys)

#UniqueHotkeys
str(skilldata$UniqueHotkeys)

hist(skilldata$UniqueHotkeys,breaks = 12,ylim = c(0,0.4),probability = TRUE)
lines(density(skilldata_1$UniqueHotkeys), col = mycol[1],lwd = 2)
lines(density(skilldata_2$UniqueHotkeys), col = mycol[2],lwd = 2)
lines(density(skilldata_3$UniqueHotkeys), col = mycol[3],lwd = 2)
lines(density(skilldata_4$UniqueHotkeys), col = mycol[4],lwd = 2)
lines(density(skilldata_5$UniqueHotkeys), col = mycol[5],lwd = 2)
lines(density(skilldata_6$UniqueHotkeys), col = mycol[6],lwd = 2)
lines(density(skilldata_7$UniqueHotkeys), col = mycol[7],lwd = 2)
lines(density(skilldata_8$UniqueHotkeys), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_UHK = mean(UniqueHotkeys, na.rm = TRUE))
summary(skilldata)

#MinimapAttacks
str(skilldata$MinimapAttacks)

hist(skilldata$MinimapAttacks,breaks = 16,ylim = c(0,15000),probability = TRUE)
lines(density(skilldata_1$MinimapAttacks), col = mycol[1],lwd = 2)
lines(density(skilldata_2$MinimapAttacks), col = mycol[2],lwd = 2)
lines(density(skilldata_3$MinimapAttacks), col = mycol[3],lwd = 2)
lines(density(skilldata_4$MinimapAttacks), col = mycol[4],lwd = 2)
lines(density(skilldata_5$MinimapAttacks), col = mycol[5],lwd = 2)
lines(density(skilldata_6$MinimapAttacks), col = mycol[6],lwd = 2)
lines(density(skilldata_7$MinimapAttacks), col = mycol[7],lwd = 2)
lines(density(skilldata_8$MinimapAttacks), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_MA = mean(MinimapAttacks, na.rm = TRUE))


#MinimapRightClicks
str(skilldata$MinimapRightClicks)

hist(skilldata$MinimapRightClicks,breaks = 16,ylim = c(0,3000),probability = TRUE)
lines(density(skilldata_1$MinimapRightClicks), col = mycol[1],lwd = 2)
lines(density(skilldata_2$MinimapRightClicks), col = mycol[2],lwd = 2)
lines(density(skilldata_3$MinimapRightClicks), col = mycol[3],lwd = 2)
lines(density(skilldata_4$MinimapRightClicks), col = mycol[4],lwd = 2)
lines(density(skilldata_5$MinimapRightClicks), col = mycol[5],lwd = 2)
lines(density(skilldata_6$MinimapRightClicks), col = mycol[6],lwd = 2)
lines(density(skilldata_7$MinimapRightClicks), col = mycol[7],lwd = 2)
lines(density(skilldata_8$MinimapRightClicks), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_MRA = mean(MinimapRightClicks, na.rm = TRUE))

#NumberOfPACs
str(skilldata$NumberOfPACs)

hist(skilldata$NumberOfPACs,breaks = 16,ylim = c(0,1000),probability = TRUE)
lines(density(skilldata_1$NumberOfPACs), col = mycol[1],lwd = 2)
lines(density(skilldata_2$NumberOfPACs), col = mycol[2],lwd = 2)
lines(density(skilldata_3$NumberOfPACs), col = mycol[3],lwd = 2)
lines(density(skilldata_4$NumberOfPACs), col = mycol[4],lwd = 2)
lines(density(skilldata_5$NumberOfPACs), col = mycol[5],lwd = 2)
lines(density(skilldata_6$NumberOfPACs), col = mycol[6],lwd = 2)
lines(density(skilldata_7$NumberOfPACs), col = mycol[7],lwd = 2)
lines(density(skilldata_8$NumberOfPACs), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_NOP = mean(NumberOfPACs, na.rm = TRUE))


#GapBetweenPACs
str(skilldata$GapBetweenPACs)

hist(skilldata$GapBetweenPACs,breaks = 16,ylim = c(0,0.08),probability = TRUE)
lines(density(skilldata_1$GapBetweenPACs), col = mycol[1],lwd = 2)
lines(density(skilldata_2$GapBetweenPACs), col = mycol[2],lwd = 2)
lines(density(skilldata_3$GapBetweenPACs), col = mycol[3],lwd = 2)
lines(density(skilldata_4$GapBetweenPACs), col = mycol[4],lwd = 2)
lines(density(skilldata_5$GapBetweenPACs), col = mycol[5],lwd = 2)
lines(density(skilldata_6$GapBetweenPACs), col = mycol[6],lwd = 2)
lines(density(skilldata_7$GapBetweenPACs), col = mycol[7],lwd = 2)
lines(density(skilldata_8$GapBetweenPACs), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_GBP = mean(GapBetweenPACs, na.rm = TRUE))


#ActionLatency
str(skilldata$ActionLatency)

hist(skilldata$ActionLatency,breaks = 16,ylim = c(0,0.08),probability = TRUE)
lines(density(skilldata_1$ActionLatency), col = mycol[1],lwd = 2)
lines(density(skilldata_2$ActionLatency), col = mycol[2],lwd = 2)
lines(density(skilldata_3$ActionLatency), col = mycol[3],lwd = 2)
lines(density(skilldata_4$ActionLatency), col = mycol[4],lwd = 2)
lines(density(skilldata_5$ActionLatency), col = mycol[5],lwd = 2)
lines(density(skilldata_6$ActionLatency), col = mycol[6],lwd = 2)
lines(density(skilldata_7$ActionLatency), col = mycol[7],lwd = 2)
lines(density(skilldata_8$ActionLatency), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_AL = mean(ActionLatency, na.rm = TRUE))

#ActionsInPAC
str(skilldata$ActionsInPAC)

hist(skilldata$ActionsInPAC,breaks = 16,ylim = c(0,0.4),probability = TRUE)
lines(density(skilldata_1$ActionsInPAC), col = mycol[1],lwd = 2)
lines(density(skilldata_2$ActionsInPAC), col = mycol[2],lwd = 2)
lines(density(skilldata_3$ActionsInPAC), col = mycol[3],lwd = 2)
lines(density(skilldata_4$ActionsInPAC), col = mycol[4],lwd = 2)
lines(density(skilldata_5$ActionsInPAC), col = mycol[5],lwd = 2)
lines(density(skilldata_6$ActionsInPAC), col = mycol[6],lwd = 2)
lines(density(skilldata_7$ActionsInPAC), col = mycol[7],lwd = 2)
lines(density(skilldata_8$ActionsInPAC), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_AIP = mean(ActionsInPAC, na.rm = TRUE))

#TotalMapExplored
str(skilldata$TotalMapExplored)

hist(skilldata$TotalMapExplored,breaks = 16,ylim = c(0,0.1),probability = TRUE)
lines(density(skilldata_1$TotalMapExplored), col = mycol[1],lwd = 2)
lines(density(skilldata_2$TotalMapExplored), col = mycol[2],lwd = 2)
lines(density(skilldata_3$TotalMapExplored), col = mycol[3],lwd = 2)
lines(density(skilldata_4$TotalMapExplored), col = mycol[4],lwd = 2)
lines(density(skilldata_5$TotalMapExplored), col = mycol[5],lwd = 2)
lines(density(skilldata_6$TotalMapExplored), col = mycol[6],lwd = 2)
lines(density(skilldata_7$TotalMapExplored), col = mycol[7],lwd = 2)
lines(density(skilldata_8$TotalMapExplored), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_TME = mean(TotalMapExplored, na.rm = TRUE))
# 프로씬은 맵확인을 많이 하지 않음

#WorkersMade
str(skilldata$WorkersMade)

hist(skilldata$WorkersMade,breaks = 16,ylim = c(0,1800),probability = TRUE)
lines(density(skilldata_1$WorkersMade), col = mycol[1],lwd = 2)
lines(density(skilldata_2$WorkersMade), col = mycol[2],lwd = 2)
lines(density(skilldata_3$WorkersMade), col = mycol[3],lwd = 2)
lines(density(skilldata_4$WorkersMade), col = mycol[4],lwd = 2)
lines(density(skilldata_5$WorkersMade), col = mycol[5],lwd = 2)
lines(density(skilldata_6$WorkersMade), col = mycol[6],lwd = 2)
lines(density(skilldata_7$WorkersMade), col = mycol[7],lwd = 2)
lines(density(skilldata_8$WorkersMade), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_WM = mean(WorkersMade, na.rm = TRUE))
par(mfrow=c(4,1))

#UniqueUnitsMade
str(skilldata$UniqueUnitsMade)

hist(skilldata$UniqueUnitsMade,breaks = 10,ylim = c(0,0.5),probability = TRUE)
lines(density(skilldata_1$UniqueUnitsMade), col = mycol[1],lwd = 2)
lines(density(skilldata_2$UniqueUnitsMade), col = mycol[2],lwd = 2)
lines(density(skilldata_3$UniqueUnitsMade), col = mycol[3],lwd = 2)
lines(density(skilldata_4$UniqueUnitsMade), col = mycol[4],lwd = 2)
lines(density(skilldata_5$UniqueUnitsMade), col = mycol[5],lwd = 2)
lines(density(skilldata_6$UniqueUnitsMade), col = mycol[6],lwd = 2)
lines(density(skilldata_7$UniqueUnitsMade), col = mycol[7],lwd = 2)
lines(density(skilldata_8$UniqueUnitsMade), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_UUM = mean(UniqueUnitsMade, na.rm = TRUE))

#ComplexUnitsMade
str(skilldata$ComplexUnitsMade)

hist(skilldata$ComplexUnitsMade,breaks = 16,ylim = c(0,30000),probability = TRUE)
lines(density(skilldata_1$ComplexUnitsMade), col = mycol[1],lwd = 2)
lines(density(skilldata_2$ComplexUnitsMade), col = mycol[2],lwd = 2)
lines(density(skilldata_3$ComplexUnitsMade), col = mycol[3],lwd = 2)
lines(density(skilldata_4$ComplexUnitsMade), col = mycol[4],lwd = 2)
lines(density(skilldata_5$ComplexUnitsMade), col = mycol[5],lwd = 2)
lines(density(skilldata_6$ComplexUnitsMade), col = mycol[6],lwd = 2)
lines(density(skilldata_7$ComplexUnitsMade), col = mycol[7],lwd = 2)
lines(density(skilldata_8$ComplexUnitsMade), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


skilldata %>%
  group_by(LeagueIndex) %>%
  summarize(mean_CUM = mean(ComplexUnitsMade, na.rm = TRUE))

#ComplexAbilitiesUsed
str(skilldata$ComplexAbilitiesUsed)

hist(skilldata$ComplexAbilitiesUsed,breaks = 16,ylim = c(0,12000),probability = TRUE)
lines(density(skilldata_1$ComplexAbilitiesUsed), col = mycol[1],lwd = 2)
lines(density(skilldata_2$ComplexAbilitiesUsed), col = mycol[2],lwd = 2)
lines(density(skilldata_3$ComplexAbilitiesUsed), col = mycol[3],lwd = 2)
lines(density(skilldata_4$ComplexAbilitiesUsed), col = mycol[4],lwd = 2)
lines(density(skilldata_5$ComplexAbilitiesUsed), col = mycol[5],lwd = 2)
lines(density(skilldata_6$ComplexAbilitiesUsed), col = mycol[6],lwd = 2)
lines(density(skilldata_7$ComplexAbilitiesUsed), col = mycol[7],lwd = 2)
lines(density(skilldata_8$ComplexAbilitiesUsed), col = mycol[8],lwd = 2)
legend('topright',c('Bronze','Silver','Gold','Platinum','Diamond','Master','GrandMaster','Pro'),col = c('saddle brown','Azure 3','gold2','AQUAMARINE','plum','light sky blue',' royal blue','midnight blue'),pch=15)


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
