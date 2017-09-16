# NAVER API
Sys.setlocale("LC_ALL", "Korean")
library(httr)
library(rvest)
rm(list = ls())
library(httr)
library(rvest)
Sys.setlocale("LC_ALL", "Korean")
client_id = 'aaoFMXW56HWyxt1gsLqj';
client_secret = 'bbx6GpYpRw';

# add header? (add information of id and password)
header = httr::add_headers('X-Naver-Client-Id' = client_id,
                           'X-Naver-Client-Secret' = client_secret)
query.n =  query = '허니버터칩'
# convert encoding 
query = iconv(query, to = 'UTF-8', toRaw = T)
query = paste0('%', paste(unlist(query), collapse = '%'))
query = toupper(query)
# make URL
end_num = 1000
display_num = 100
start_point = seq(1,end_num,display_num)
i = 1
url = paste0('https://openapi.naver.com/v1/search/blog.xml?query=',query,'&display=',display_num,'&start=',start_point[i],'&sort=sim')
url_body = read_xml(GET(url, header))

title = url_body %>% xml_nodes('item title') %>%
  xml_text()
bloggername = url_body %>% 
  xml_nodes('item bloggername') %>% xml_text()
postdate = url_body %>% xml_nodes('postdate') %>%
  xml_text()
link = url_body %>% xml_nodes('item link') %>%
  xml_text()
description = url_body %>% xml_nodes('item description') %>%
  html_text()


# loop code
final_dat = NULL
for(i in 1:length(start_point))
{
  # request xml format
  url = paste0('https://openapi.naver.com/v1/search/blog.xml?query=',query,'&display=',display_num,'&start=',start_point[i],'&sort=sim')
  #option header
  url_body = read_xml(GET(url, header), encoding = "UTF-8")
  title = url_body %>% xml_nodes('item title') %>% xml_text()
  bloggername = url_body %>% xml_nodes('item bloggername') %>% xml_text()
  postdate = url_body %>% xml_nodes('postdate') %>% xml_text()
  link = url_body %>% xml_nodes('item link') %>% xml_text()
  description = url_body %>% xml_nodes('item description') %>% html_text()
  temp_dat = cbind(title, bloggername, postdate, link, description)
  final_dat = rbind(final_dat, temp_dat)
  cat(i, '\n')
}
final_dat = data.frame(final_dat, stringsAsFactors = F)

library(dplyr)

tb <- table(final_dat[,2])
top.blogger<- sort(tb, decreasing = T)[1:4]
tmp <- final_dat %>% select(bloggername, link) %>%
  filter(bloggername %in% names(top.blogger) )

tb <- table(final_dat$postdate)
head(tb)

names(tb) %>%head() # 문자열로 데이터 정리
x <- as.Date(names(tb), format = '%Y%m%d')
y <- as.numeric(tb) # 검색량
# 데이터의 날짜에 관한 전처리
?strptime

plot(x,y,pch = 19,cex = 0.5)


library(pspline)
fit <- sm.spline(x = as.integer(x),y= y,cv=TRUE) #smooth spline 
lines(x =x , y = fit$ysmth, lty = 2, lwd = 2, col = 'blue')
as.Date('2017-09-12') - as.Date('1990-05-11')
str(fit)

x[1]
as.integer(x[1])
as.Date(as.integer(x[1]), origin = '1970-01-01')
as.Date(500,origin = '1970-01-01')
# 빈 날짜를 0으로 채우기
x <- min(x):max(x)
xx <- as.Date(as.integer(min(x)):as.integer(max(x)),origin = '1970-01-01' )
xx
yy <- rep(0,length(xx))
yy[xx%in%x] <- y # %in% 함수 활용하기


plot(xx,yy,pch = 19, cex = 0.5)
fit <- sm.spline(x = as.integer(xx),y= yy,cv=TRUE) #smooth spline 
lines(x =xx , y = fit$ysmth, lty = 2, lwd = 2, col = 'blue')


###################################################################3
# 국소다항 회귀
xx
yy
xint <- as.integer(xx)
rdata = data.frame(y=yy,x=xint)

fit <- loess(y~x, data = rdata, span = 0.1, normalize = FALSE)
points(fit$x,fit$fitted, type = 'l', lty = 2, lwd = 1.5, col = 'blue')

k.fold = 5
set.seed(1)
idx <- sample(1:k.fold,length(xint),replace = TRUE)
k = 1
rdata.tr <- rdata[idx !=k,]
rdata.va <- rdata[idx == k,]

fit <- loess(y~x,data = rdata.tr,span = 0.1, normalize = FALSE)
fit.y <- predict(fit,newdata = rdata.va) # newdata에 vali, fit은 예측된 y
sqrt(mean((fit.y-rdata.va$y)^2,na.rm=T)) # 잘했는지 못했는지 기준을 mean square


k = 2
rdata.tr <- rdata[idx !=k,]
rdata.va <- rdata[idx == k,]

fit <- loess(y~x,data = rdata.tr,span = 0.1, normalize = FALSE)
fit.y <- predict(fit,newdata = rdata.va) # newdata에 vali, fit은 예측된 y
mean((fit.y-rdata.va$y)^2,na.rm=T) # 잘했는지 못했는지 기준을 mean sq

valid.err <- c()
for (k in 1:k.fold){
  k = 1
  rdata.tr <- rdata[idx !=k,]
  rdata.va <- rdata[idx == k,]
  
  fit <- loess(y~x,data = rdata.tr,span = 0.1, normalize = FALSE)
  fit.y <- predict(fit,newdata = rdata.va) # newdata에 vali, fit은 예측된 y
  valid.err[k] <- mean((fit.y-rdata.va$y)^2,na.rm=T)}
valid.err

final_dat[10,5]
