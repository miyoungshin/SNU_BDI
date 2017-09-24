# 강의록 주소 : http://ranking.uos.ac.kr/bigdata.php
setwd('C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
library(rvest)
library(dplyr)

# web scraping 
url_tvcast = 'http://tvcast.naver.com/jtbc.youth'
html_tvcast = read_html(x = url_tvcast, encoding = 'UTF-8')
html_tvcast %>% html_nodes(".title a") %>% html_text() %>% data.frame()

url_king = 'http://tv.naver.com/mbc.kingloves'
html_king = read_html(x = url_king, encoding = 'UTF-8')
html_king %>% html_nodes('.title a') %>% html_text() %>% data.frame() %>% head(3)

text <- html_king %>% html_nodes('.title a') %>% html_text() %>% data.frame()

url_wiki <- "https://en.wikipedia.org/wiki/Student%27s_t-distribution"
html_wiki <- read_html(x = url_wiki, encoding = 'UTF-8')
t_table <- html_wiki %>% html_nodes(".wikitable") %>% html_table() %>% data.frame()

url_mlb <- '"https://www.baseball-reference.com/leagues/MLB/2017.shtml"'
html_mlb <- read_html( x = url_mlb, encoding = 'URF-8')
a <- html_mlb %>% html_nodes('div#div_teams_standard_batting table') %>%
  html_table()

write.csv(a,'a.csv')

#!! EPL 경기정보 크롤링
url_epl <- 'http://score.sports.media.daum.net/record/soccer/epl/trnk.daum'
html_epl <- read_html(x = url_epl, encoding = 'UTF-8')
html_epl %>% html_nodes('div#table1 tbody')
