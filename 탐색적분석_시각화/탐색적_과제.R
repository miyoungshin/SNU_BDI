# 데이터 불러오기

setwd('C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
skilldata = read.csv('SkillCraft1_Dataset.csv')
wine_red = read.csv('winequality-red.csv')
wine_white = read.csv('winequality-white.csv')

# skilldata
summary(skilldata)
