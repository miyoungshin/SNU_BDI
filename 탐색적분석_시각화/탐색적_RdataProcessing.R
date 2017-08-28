# 강의록 주소 : http://ranking.uos.ac.kr/bigdata.php
setwd('C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화')


### R Data processing by index ###
surveys <- read.csv('surveys.csv')
class(surveys)

# 데이터의 이름을 확인할 때 사용 
names(surveys)
<<<<<<< HEAD:탐색적분석_시각화/탐색적_RdataProcessing.R
summary(surveys)
str(surveys)
=======

# 데이터에 대한 기초통계량 확인
str(surveys) ## str()은 각각 변수의 타입(int,factor)을 알려줌

summary(surveys) ## summary()에서 int는 평균,4분위수를 알려줌/ factor는 각각의 변수를 알려줌

# indexing 및 Filtering을 이용한 데이터 정리
match(c('plot_id','species_id','weight'), names(surveys)) #위치를 알려줌

surveys[,match(c('plot_id','species_id','weight'), names(surveys))]
surveys[,c('plot_id','species_id','weight')]
surveys[c('plot_id','species_id','weight')]

# 특정 값을 만족하는 데이터만 추출
surveys$year == 1995 ## T/F 형태로 데이터를 보여줌
surveys[surveys$year == 1995,]
head(surveys[surveys$year == 1995,])

## weight가 5미만인 데이터의 speices_id, sex, weight 열을 찾아보기 
surveys[surveys$weight < 5, c('species_id','sex','weight')] # 안되는 이유는??
surveys[which(surveys$weight<5),c('species_id','sex','weight')]

### indexing 및 filtering을 이용한 통계량 계산

u <- unique(surveys$sex)
u
length(u)
class(surveys$sex)
levels(surveys$sex)
# 성별에 따른 weight값의 평균 계산 (불편함)
mean(surveys$weight[surveys$sex == u[1]],na.rm=T)
mean(surveys$weight[surveys$sex == u[2]],na.rm=T)
mean(surveys$weight[surveys$sex == u[3]],na.rm=T)

aggregate(formula = weight ~ sex, data = surveys, FUN = mean, na.rm= TRUE)


>>>>>>> a4ff22fcb8801a3b1e7030ecf1dd732f5c32d507:탐색적분석_시각화/탐색적_20170817.R
### remember ##### 


for (i in 1:10) eval ( parse (text = paste0("fit",i,"<- i")) )
ls()
a = list()
a[[1]] = ' a1 <- 1'
a[[2]] = ' a2 <- 2'

eval( parse (text = a) )
###################

rm(list = ls())
gc()
if (!require(dplyr)) { install.packages("dplyr") ; library(dplyr) }
surveys <- read.csv(file = 'surveys.csv')

# 데이터 불러오기
surveys = read.csv('surveys.csv',header = TRUE)

# 특정 열에 해당되는 데이터 값을 불러오기
match(c("plot_id", "species_id", "weight"),  names(surveys))
?match

surveys[, match(c("plot_id", "species_id", "weight"),  names(surveys)) ]
surveys[,c("plot_id", "species_id", "weight") ]
surveys[c("plot_id", "species_id", "weight") ]

# 특정 값에 해당되는 데이터 추출
surveys$year == 1995
surveys[surveys$year == 1995, ]
head(surveys[surveys$year == 1995, ])

<<<<<<< HEAD:탐색적분석_시각화/탐색적_RdataProcessing.R

surveys[which(surveys$weight<5), c("species_id", "sex", "weight")]
head(surveys[which(surveys$weight<5), 
             c("species_id", "sex", "weight")])
=======
# select and filter
surveys[surveys$weight<5, c("species_id", "sex", "weight")]
head(surveys[surveys$weight<5, c("species_id", "sex", "weight")])
# check NA
head(surveys[which(surveys$weight<5), c("species_id", "sex", "weight")])
head(surveys[which(surveys$weight<5), c("species_id", "sex", "weight")])
>>>>>>> a4ff22fcb8801a3b1e7030ecf1dd732f5c32d507:탐색적분석_시각화/탐색적_20170817.R


surveys_sml <- surveys[which(surveys$weight<5), 
                       c("species_id", "sex", "weight")]

surveys_ex <- surveys
surveys_ex$weight_kg <- surveys_ex$weight/1000

# NA를 필터링 하는 코드
surveys_ex <- surveys_ex[!is.na(surveys_ex$weight_kg),] 
head(surveys_ex)

u <- unique(surveys$sex)
length(u)

#factor는 숫자
class(surveys$sex)
levels(surveys$sex)

mean(surveys$weight[surveys$sex == u[1]],na.rm = T)
mean(surveys$weight[surveys$sex == u[2]],na.rm = T)
mean(surveys$weight[surveys$sex == u[3]],na.rm = T)

#  trim = 절삭평균
a <- by(data = surveys$weight,INDICES = surveys$sex, FUN = mean, na.rm = TRUE, trim = 0.1)
a
a <- unclass(a)


# 엄청 많이 씀!!!!!
# sex별로 weight값을 계산해 줌
aggregate(weight~sex, data = surveys, FUN = mean, na.rm = TRUE)
aggregate(weight~sex, data = surveys, FUN = median, na.rm = TRUE)

# index가 많을 경우 +로 함수들을 더해주면 된다.
aggregate(weight~sex + species_id, data = surveys, FUN = mean, na.rm = TRUE)


surveys$species_id
# na.rm -> missing value 를 자동 처리!
tmp1<-aggregate(weight~sex + species_id, data = surveys, FUN = mean, na.rm = TRUE)
tmp2<-aggregate(weight~sex + species_id, data = surveys, FUN = min, na.rm = TRUE)

# cut <- 관측 변수 numeric을 범주형으로 나눠줄때
x <- rnorm(100)
cut(x,breaks = c(-Inf,-0.3,0.3,Inf))
as.integer(cut(x,breaks = c(-Inf,-0.3,0.3,Inf)))

# total num 
table(surveys$sex)
table(surveys$sex, surveys$plot_id)

#sort -> 시간 순으로 되어있는 데이터를 다룰 때 중요! (아래단계 부터 윗단계로 sort해야함!)
surveys[order(plot_id)]
surveys$plot_id
head(order(surveys$plot_id))

head(surveys[order(surveys$plot_id),])

# double sort
tmp <- surveys 
tmp <- tmp[order(tmp$plot_id),]
tmp <- tmp[order(tmp$month),]
head(tmp)
## arrange()


# dplyr
library(dplyr)

select(.data=surveys,plot_id,species_id,weight)

# weight가 na인 값 제외 하고 불러오기
select(.data=surveys,plot_id,species_id,weight) %>% filter(!is.na(weight))


# 응용
surveys %>% filter(!is.na(weight)) %>% filter(!is.na(sex)) %>% filter(weight <5) %>% select(species_id, sex, weight) %>% head()


# dplyr를 활용한 통계량 계산
surveys %>% group_by(sex) %>% summarize(mean_weight= mean(weight, na.rm = TRUE))
                                        
select(surveys, plot_id, species_id, weight) %>% head

filter(surveys, year == 1995) %>% head

filter(.data = surveys, year == 1995) %>% head()

surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight) %>% head

surveys_sml <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

surveys_ex <- surveys %>% filter( !is.na(surveys$weight)) %>% mutate(weight_kg = weight/1000)
surveys_ex <- surveys %>% filter( !is.na(surveys$weight)) %>%
  mutate(weight_kg = weight / 1000) 
head(surveys_ex)


#tmp <- surveys %>% group_by(sex)

#### summarize 함수 꼭 필요한 함수!!!!!!!!!!!!!!!!!

## aggregate 역할을 함
surveys %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight)) %>%
  print(n=15)

### good !
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            min_weight = min(weight)) %>%
  print(n = 30)

surveys %>%
  group_by(sex) %>%
  tally()

surveys %>%
  group_by(plot_id, sex) %>%
  tally()
## sorting -> arrange함수는 순서대로 하면 됨
surveys %>% arrange(month, plot_id) %>% head()
surveys %>% arrange(desc(month), plot_id) %>% head()
tbl_df(surveys)
?tbl_df


## 
rm(list = ls())
gc()
if (!require(reshape2)) { install.packages("reshape2") ; library(reshape2) }
if (!require(dplyr)) { install.packages("dplyr") ; library(dplyr) }
airquality
str(airquality)
names(airquality) <-  tolower(names(airquality))
aql <- melt(airquality, id.vars= c("month","day"))
head(aql)

aql <- melt(airquality, id.vars = c("month", "day"),
            variable.name = "climate_variable", 
            value.name = "climate_value")
head(aql)
melt(airquality, id.vars= c("month","day")) %>% head()

aqw <- dcast(aql, month + day ~ climate_variable, 
             value.var ="climate_value")
head(aqw)
# good !!
dcast(aql, month ~ climate_variable, fun.aggregate = mean, 
      na.rm = TRUE, margins  = TRUE)
# margins
# 2 line 
aggregate( climate_value ~ climate_variable + month, 
           data = aql, FUN = mean, na.rm = T) %>% 
  dcast(month ~ climate_variable, value.var = 'climate_value')



## R color
plot(1:20, y=rep(0,20), col = 1:20, cex = 2, pch = 20 )
head(colors())
tail(colors())

mycol = colors()
plot(1:80, y=rep(1,80), col = mycol[1:80], cex = 2, pch = 20, 
     ylim = c(0,1) )
points(1:80, y=rep(0.5,80), col = mycol[81:160], cex = 2, pch = 20 )
points(1:80, y=rep(0,80), col = mycol[161:240], cex = 2, pch = 20 )
image(matrix(1:25^2,25,25), col = mycol)

# RGB
rgb(10, 4, 23, maxColorValue = 255, alpha = 10)
rgb(10, 4, 23, maxColorValue = 25, alpha = 10)
col2rgb('lightblue')

hsv(0.3, 0.5, 0.1, alpha = 0.4)
hcl(h = 0, c = 35, l = 85, alpha = 0.1)


mycol = heat.colors(20, alpha = 1)
plot(1:20, y=rep(0,20), col = mycol, cex = 2, pch = 20 )
mycol = topo.colors(20, alpha = 1)
plot(1:20, y=rep(0,20), col = mycol, cex = 2, pch = 20 )

x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))
image(x, y, volcano, col = heat.colors(20, alpha = 1), axes = FALSE)
contour(x, y, volcano, levels = seq(90, 200, by = 5),
        add = TRUE, col = 'white')

x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))
image(x, y, volcano, col = topo.colors(20, alpha = 1), axes = FALSE)
contour(x, y, volcano, levels = seq(90, 200, by = 5),
        add = TRUE, col = 'white')

rainbow(5, s = 0.4, v = 0.3, start = 0, end = 0.05, alpha = 1)


library(colorspace)
mycol = diverge_hcl(40, h = c(246, 40), c = 96, l = c(65, 90))
image(x, y, volcano, col = mycol, axes = FALSE)


library(colorspace)
pal = choose_palette()
mycol <- pal(20, alpha = 1)
image(x, y, volcano, col = mycol, axes = FALSE) 

