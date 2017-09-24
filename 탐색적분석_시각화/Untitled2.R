# 강의록 주소 : http://ranking.uos.ac.kr/bigdata.php
setwd('C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
setwd('/Users/arnorfati/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
install.packages('arulesViz')
library(arulesViz)
data('Groceries')
str(Groceries)

rules <- apriori(Groceries, parameter=list(support=0.001,confidence=0.5))
a <- inspect(head(arules::sort(rules, by = 'lift'),10))
write.csv(a,'a.csv')

plot(rules,method =NULL, measure = 'support', shading = 'lift')
plot(rules, measure = c('support','lift'), shading = 'confidence',interactive = TRUE)

install.packages('networkD3')
library(networkD3)
install.packages('igraph')
library(igraph)
src <- c('A','A','A','A','B','B','C','C','D')
target <- c('B','C','D','J','E','F','G','H','I')
networkData <- data.frame(src,target)
head(networkData)
networkD3::simpleNetwork(networkData,fontSize = 15, zoom = T)

forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = 'source',Target = 'target',Value = 'value'
             NodeID = 'name', Group = 'group', opacity = 0.8, zoom = TRUE)

install.packages('ggplot2')
library(ggplot2)
data(msleep)
head(msleep[,c(3,6,11)])
ggplot(data = msleep, aes(x = log(bodywt), y = sleep_total)) + geom_point()
names(mslee)
ggplot(data = msleep,aes(x = log(bodywt), y = sleep_total, col = vore)) +geom_point() +facet_grid(~vore)
?geom_point # Aesthetics - 미학?

# 로그관련
set.seed(1)
x1 <- 1:10
x2 <- rnorm(10)
cor(x1,x2,method ='kendall')
cor(x1,exp(x2),method = 'kendall')
cor(x1,x2)
cor(x1,exp(x2))


ggplot(data = msleep,aes(x = vore, y = sleep_total, col = vore)) +geom_point() + geom_jitter()

ggplot(data = msleep,aes(x = factor(mylevels), y = myvalues)) +geom_line(gourp = 1)
ggplot(economics, aes(date, unemploy)) + geom_line()
# aes는 x,y축


presidential
economics
presidential = subset(presidential, start > economics$date[1]) # 
ggplot(economics) + geom_rect(aes(xmin = start,xmax = end, fill = party), 
                              ymin = -Inf, ymax = Inf, data = presidential) +
  geom_line(aes(date, unemploy), data = economics)

library(datasets)
data("airquality")
plot(airquality$Ozone, type = 'l')


aq_trim <- airquality[which(airquality$Month == 7 |
                              airquality$Month == 8 |
                              airquality$Month == 9), ]
aq_trim$Month <- factor(aq_trim$Month,labels = c("July", "August", "September"))
ggplot(aq_trim, aes(x =Day, y=Ozone, size = Wind, fill = Temp)) + geom_point(shape = 21) +
  scale_x_continuous(breaks = seq(1,31,5))

#geom_histogram -> 히스토그램을 그리려면 빈도가 필요함.

festival.data <- read.table(file ='DownloadFestival.dat',sep='\t',header=T)
head(festival.data)

Day1Histogram <- ggplot(data = festival.data, aes( x= day1))
Day1Histogram + geom_histogram()

Day1Histogram + geom_histogram(color = 'royalblue1', fill = 'royalblue2',binwidth = 0.1)

Day1Histogram + geom_histogram(color = 'royalblue1',aes( y = ..density..) ,fill = 'royalblue2',bins = 35)

Day1Histogram + geom_histogram(binwidth = 0.2, aes( y = ..density..), 
                               color= 'royalblue3', fill = 'yellow', bins = 35)

Day1Histogram +geom_histogram(binwidth = 0.1, aes(y=..density..), 
                              color="black", 
                              fill="lightblue") + geom_density(alpha=.2, fill="#FF6666")

library(reshape2)
festival.data.stack <- melt(festival.data, id = c('ticknumb', 'gender'))
colnames(festival.data.stack)[3:4] <- c('day', 'score')

Histogram.3day2 <- ggplot( data = festival.data.stack, aes(x = score)) + 
  geom_histogram(binwidth = 0.4, color= 'black', fill = 'yellow') + 
  labs( x = 'Score', y = 'Counts')

Histogram.3day2 <- ggplot( data = festival.data.stack, aes(x = score)) + 
  geom_histogram(binwidth = 0.2, color= 'black', fill = 'yellow') + 
  labs( x = 'Score', y = 'Counts')


Histogram.3day2 + facet_grid(~gender) # 여자가 많이 왔네?

Histogram.3day2 + facet_grid(gender~day)

Histogram.3day2 <- ggplot( data = festival.data.stack, aes(x = score,
                                                           y = ..density..)) + 
  geom_histogram(binwidth = 0.4, color= 'black', fill = 'yellow') + 
  labs( x = 'Score', y = 'Counts')
Histogram.3day2
Histogram.3day2 + facet_grid(gender~day)

install.packages('maps')
library(map)
wm = map_data('world')

load(file='storms.RData')
library(dplyr)
substorms = storms %>% filter(Season %in% 1999:2010) %>%
  filter(!is.na(Season)) %>%
  filter(Name!="NOT NAMED")
substorms$ID = as.factor(paste(substorms$Name, 
                               substorms$Season, sep = "."))
substorms$Name = as.factor(substorms$Name)

map1 = ggplot(substorms, 
              aes(x = Longitude, y = Latitude, group = ID)) + 
  geom_polygon(data = wm, 
               aes(x = long, y = lat, group = group), 
               fill = "gray25", colour = "gray10", size = 0.2) + 
  geom_path(data = substorms, 
            aes(group = ID, colour = Wind.WMO.),
            alpha = 0.5, size = 0.8) +
  xlim(-138, -20) + ylim(3, 55) + 
  labs(x = "", y = "", colour = "Wind \n(knots)")
map1

map2 = ggplot(substorms, 
              aes(x = Longitude, y = Latitude, group = ID)) + 
  geom_polygon(data = wm, 
               aes(x = long, y = lat, group = group), 
               fill = "gray25", colour = "gray10", size = 0.2) + 
  geom_path(data = substorms, 
            aes(group = ID, colour = Wind.WMO.), size = 0.5) + 
  xlim(-138, -20) + ylim(3, 55) + 
  labs(x = "", y = "", colour = "Wind \n(knots)") + 
  facet_wrap(~Month) 
map2
install.packages('mapdata')
library(mapdata)
map(database = 'world',regions = 'South Korea')
map('world2Hires','South Korea')
wm <- ggplot2::map_data('world2Hires')

kr1 <- wm %>% filter(region == 'South Korea')
unique(kr1$subregion)
?map

data(us.cities)
head(us.cities)
map('state','GEORGIA')
map.cities(us.cities, country = 'LA')

map('world',fill = TRUE, col = rainbow(30))

data(unemp) # unemployed rate data
data(county.fips) # county fips data
head(unemp,3)
head(county.fips,3)

unemp$colorBuckets <- as.numeric(cut(unemp$unemp, 
                                     c(0, 2, 4, 6, 8, 10, 100)))
colorsmatched <- unemp$colorBuckets[match(county.fips$fips, unemp$fips)]
names(wm)
wm$region
unique(wm$region)

install.packages('mapproj')
library(mapproj)

colors = c("#F1EEF6","#D4B9DA","#C994C7","#DF65B0","#DD1C77","#980043")
library(mapproj)
map("county", col = colors[colorsmatched], fill = TRUE,
    resolution = 0, lty = 0, projection = "polyconic")

