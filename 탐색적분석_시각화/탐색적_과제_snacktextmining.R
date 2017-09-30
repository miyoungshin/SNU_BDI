# Title   : 탐색적분석 과제_과자Textmining
# Summary : 네이버 API를 통해 검색량, 트렌드, 워드클라우드, 상관관계 분석


# 0. library & 환경 설정
rm(list = ls())
getwd('C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화')
library(httr)
library(rvest)
library(dplyr)
library(pspline)
library(KoNLP)
library(rJava)
library(tm)
library(dplyr)
library(qgraph)


# 1. NAVER API 설정------------------------------------------------------------------------------------------------
client_id = 'aaoFMXW56HWyxt1gsLqj';
client_secret = 'bbx6GpYpRw';

header = httr::add_headers('X-Naver-Client-Id' = client_id,
                           'X-Naver-Client-Secret' = client_secret)


# 2. '과자 추천' Textmining-----------------------------------------------------------------------------------------------

# 2-1. 검색어 설정
# 2-1-1 '과자 추천'
query.n =  query = '과자 추천'
query = iconv(query, to = 'UTF-8', toRaw = T)
query = paste0('%', paste(unlist(query), collapse = '%'))
query = toupper(query)

# 2-1-2 '허니버터칩'
query.n =  query = '허니버터칩'
query = iconv(query, to = 'UTF-8', toRaw = T)
query = paste0('%', paste(unlist(query), collapse = '%'))
query = toupper(query)


# 2-1-3 '밀차라떼 초코파이'
query.n =  query = '밀차라떼 초코파이'
query = iconv(query, to = 'UTF-8', toRaw = T)
query = paste0('%', paste(unlist(query), collapse = '%'))
query = toupper(query)


# 2-1-4 '꼬북칩'
query.n =  query = '꼬북칩'
query = iconv(query, to = 'UTF-8', toRaw = T)
query = paste0('%', paste(unlist(query), collapse = '%'))
query = toupper(query)

# 2-2. Blog Web 크롤링-----------------------------------------------------------------------------------------------

final_dat = NULL
end_num = 1000
display_num = 100
start_point = seq(1,end_num,display_num)

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

# 2-3. 날짜에 관한 전처리 --------------------------------------------------------------------------------------------------

tb <- table(final_dat$postdate)
x <-as.Date(names(tb), format = "%Y%m%d")
y <- as.numeric(tb)
fit <- sm.spline(x = as.integer(x), y = y, cv = TRUE)

xx <- as.Date(as.integer(min(x)):as.integer(max(x)),origin = "1970-01-01")
yy <- rep(0, length(xx))
yy[xx%in%x] <- y
fit<-sm.spline(xx,yy,cv = TRUE)

xint <- as.integer(xx)
rdata = data.frame(y = yy, x = xint)
fit<-loess(y~x,data = rdata, span = 0.5, normalize = FALSE)

k.fold = 5
idx <-sample(1:5, length(xint), replace = TRUE)

k = 1
rdata.tr <- rdata[idx != k, ]
rdata.va <- rdata[idx == k, ]
fit<-loess(y~x,data = rdata.tr, span = 0.1, normalize = FALSE)
fit.y<-predict(fit, newdata = rdata.va)
mean((fit.y-rdata.va$y)^2, na.rm = T)

k.fold = 10
idx <-sample(1:k.fold, length(xint), replace = TRUE)
span.var <- seq(0.02, 0.5, by  = 0.01)
valid.mat <- NULL
for (j in 1:length(span.var))
{
  valid.err <- c()
  for (k in 1:k.fold)
  {
    rdata.tr <- rdata[idx != k, ]
    rdata.va <- rdata[idx == k, ]
    fit<-loess(y~x,data = rdata.tr, 
               span = span.var[j], normalize = FALSE)
    fit.y<-predict(fit, newdata = rdata.va)
    valid.err[k] <- mean((fit.y-rdata.va$y)^2, na.rm = T)
  }
  valid.mat <- cbind(valid.mat, valid.err)
}

boxplot(valid.mat)
lines(colMeans(valid.mat), col = "green", lty = 2)

span.par<- span.var[which.min(colMeans(valid.mat))]
fit<-loess(y~x,data = rdata, 
           span = span.par, normalize = FALSE)


plot(xx,yy, type = 'n', ylab = '검색량',xlab = "블로그 작성 년도")
points(xx,fit$fited, type = 'l', lty = 1, lwd = 2, col = 'blue')


# 2-3-1. 상품 별 검색량 (허니버터칩/밀차초코파이/꼬북칩)

points(xx,fited$fit, type = 'l', lty = 1, lwd = 2, col = 'gold')
points(xx,fited$fit, type = 'l', lty = 1, lwd = 2, col = 'saddle brown')
points(xx,fited$fit, type = 'l', lty = 1, lwd = 2, col = 'lime green')
legend('topleft', c('허니버터칩','밀차 초코파이','꼬북칩'),col = c('gold','saddle brown','lime green'),lwd = 2)

# 2-4. 워드 클라우드 전처리---------------------------------------------------------------------------------------------------------
useSejongDic()
dat_tmp <- final_dat

for (i in 1:nrow(final_dat))
{
  dat_tmp[i,5]<-   gsub(pattern = "<[/|A-Za-z]*>", 
                        replace = "", final_dat[i,5])
}

dat_tmp_sub <- extractNoun(dat_tmp[,5],autoSpacing = T)
text = dat_tmp_sub
#text = dat_tmp[,5]

cps = Corpus(VectorSource(text))
dtm = tm::DocumentTermMatrix(cps, 
                             control = list(tokenize = extractNoun, 
                                            removeNumber = T,
                                            removePunctuation = T))

repair_encoding(findFreqTerms(dtm,20))


rmat <- as.matrix(dtm)

rmat <-spMatrix(dtm$nrow,dtm$ncol, i=dtm$i, j=dtm$j, x=dtm$v)
wcount<-colSums(rmat)
wname <- dtm$dimnames$Terms
wname <- repair_encoding(dtm$dimnames$Terms)


a <- (data.frame(wname,wcount))
a <- a[nchar(as.character(a[,1])) >= 2,]

wname <- a$wname
wcount <- a$wcount

sort.var <- sort(wcount,decreasing = T)[200]
idx <- !( grepl(query.n, wname)|grepl('과자', wname)|grepl('quo*',wname)|grepl('ㅠㅠ', wname)|grepl('ㅜㅜ', wname)|grepl('추천', wname)| (wcount<=sort.var))

# idx <- !( grepl(query.n, wname)|grepl('허니버터칩', wname)|grepl('quo*',wname)|grepl('ㅠㅠ', wname)|grepl('ㅜㅜ', wname)| (wcount<=sort.var))
# idx <- !( grepl(query.n, wname)|grepl('꼬북칩', wname)|grepl('quo*',wname)|grepl('ㅠㅠ', wname)|grepl('ㅜㅜ', wname)| (wcount<=sort.var))


wname.rel <- wname[idx]
wcount.rel <- wcount[idx]


pal <- c("#B8DF51","#00BB8E","#007F97", "#1D5B88","#41356E", "#009F99", "#65D174" , "#FDE333","#46024E")

wordcloud(wname.rel,freq = wcount.rel, colors = pal,family="AppleGothic",scale=c(10,1))

# 2-5.상관 계수


dtm = as.matrix(dtm)

bb <- dtm
bb.freq <- sort(colSums(bb), decreasing = T)
plot(bb.freq, pch = 19, type = 'l')

bb.freq <- bb.freq[bb.freq>quantile(bb.freq,0.99)]
idx <- match(names(bb.freq),  colnames(bb))
bb.r <- bb[,idx]
bb.r <- as.matrix(bb.r)
cor.mat <- cor(bb.r)
image(cor.mat)

par(family="Apple SD Gothic Neo")

graph1<-qgraph(cor.mat, graph="pcor", labels=rownames(cor.mat),layout="spring", sampleSize = nrow(cor.mat),
               vsize=7, cut=0, maximum=.45, border.width=1.5)
