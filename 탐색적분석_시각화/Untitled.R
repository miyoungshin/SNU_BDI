
# library 및 NAVER API 세팅------------------------------------------------------------------------------------------------
rm(list = ls())
library(httr)
library(rvest)
library(dplyr)
library(pspline)
library(KoNLP)
library(rJava)
library(tm)
library(glasso)
library(dplyr)
library(arulesViz)
library(wordcloud)
library(colorspace)
install.packages('colorspace')
remove.packages('colorspace')
client_id = 'aaoFMXW56HWyxt1gsLqj';
client_secret = 'bbx6GpYpRw';

# add header? (add information of id and password)
header = httr::add_headers('X-Naver-Client-Id' = client_id,
                           'X-Naver-Client-Secret' = client_secret)



# 검색어 UTF-8 코드 변환------------------------------------------------------------------------------------------------
query.n =  query = '과자 추천'
# convert encoding 
query = iconv(query, to = 'UTF-8', toRaw = T)
query = paste0('%', paste(unlist(query), collapse = '%'))
query = toupper(query)


# 불러 올 데이터 확보------------------------------------------------------------------------------------------------
# make URL
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
pure <- final_dat


tb <- table(pure[,2])
top.blogger<- sort(tb, decreasing = T)[1:8]
tmp <- final_dat %>% select(bloggername, link) %>%
  filter(bloggername %in% names(top.blogger) )
# 날짜에 관한 전처리 --------------------------------------------------------------------------------------------------



tb <- table(final_dat$postdate)
x <-as.Date(names(tb), format = "%Y%m%d")
y <- as.numeric(tb)
plot(x, y, pch = 19, cex = 0.5)
fit <- sm.spline(x = as.integer(x), y = y, cv = TRUE)
lines(x=x, y=fit$ysmth, lty = 2, col = 'blue')

# zero frequecy
xx <- as.Date(as.integer(min(x)):as.integer(max(x)),
              origin = "1970-01-01")
yy <- rep(0, length(xx))
yy[xx%in%x] <-y
plot(xx,yy, pch = 19, cex = 0.5)
fit<-sm.spline(xx,yy,cv = TRUE)
points(fit$x, fit$ysmth, type = 'l', lty = 2, lwd = 1.5, col = 'blue')

# local polynomial function
xint <- as.integer(xx)
rdata = data.frame(y = yy, x = xint)
fit<-loess(y~x,data = rdata, span = 0.5, normalize = FALSE)
plot(fit, pch = 19, cex = 0.5)
points(fit$x,fit$fitted, type = 'l', lty = 2, lwd = 1.5, col = 'blue')

# 
k.fold = 5
idx <-sample(1:5, length(xint), replace = TRUE)

k = 1
rdata.tr <- rdata[idx != k, ]
rdata.va <- rdata[idx == k, ]
fit<-loess(y~x,data = rdata.tr, span = 0.1, normalize = FALSE)
fit.y<-predict(fit, newdata = rdata.va)
mean((fit.y-rdata.va$y)^2, na.rm = T)

# loop 

# loop 2
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
colnames(valid.mat) <- span.var
boxplot(valid.mat, col='pale green')
lines(colMeans(valid.mat), col = "dark green", lty = 2, lwd = 2)
# check
boxplot(valid.mat)
lines(colMeans(valid.mat), col = "blue", lty = 2)

# model decision
span.par<- span.var[which.min(colMeans(valid.mat))]
fit<-loess(y~x,data = rdata, 
           span = span.par, normalize = FALSE)
plot(xx,yy, type = 'n', ylab = '검색량',xlab = "'과자추천' 블로그 작성 년도'")
points(xx,fit$fitted, type = 'l', lty = 1, lwd = 4, col = 'spring green2')


#####


# 정규표현식 & 워드 클라우드---------------------------------------------------------------------------------------------------------
# deletion tag
useSejongDic()
#extractNoun(a, autoSpacing = T)
#morph.fit <- MorphAnalyzer(a)
#morph.fit
dat_tmp <- final_dat

for (i in 1:nrow(final_dat))
{
  dat_tmp[i,5]<-   gsub(pattern = "<[/|A-Za-z]*>", 
                        replace = "", final_dat[i,5])
}
dat_tmp_sub <- extractNoun(dat_tmp[,5],autoSpacing = T)

# tm package is based on Eng. Addition option is required
text = dat_tmp_sub
#text = dat_tmp[,5]

cps = Corpus(VectorSource(text))
dtm = tm::DocumentTermMatrix(cps, 
                             control = list(tokenize = extractNoun, 
                                            removeNumber = T,
                                            removePunctuation = T))
repair_encoding(findFreqTerms(dtm,20))

repair_encoding(dtm)
a <- repair_encoding(findFreqTerms(dtm,20))
write.csv(a,'a.csv')# matrix class
rmat <- as.matrix(dtm)
dim(rmat) # 형태소 별 언급 횟수가 나옴

# sparseMatrix

rmat <-spMatrix(dtm$nrow,dtm$ncol, i=dtm$i, j=dtm$j, x=dtm$v)
wcount<-colSums(rmat)
wname <- dtm$dimnames$Terms
wname <- repair_encoding(dtm$dimnames$Terms)

colnames(wcount) <- wname

a <- (data.frame(wname,wcount))

a <- a[nchar(as.character(a[,1])) >= 2,]

wname <- a$wname
wcount <- a$wcount

sort.var <- sort(wcount,decreasing = T)[100]
idx <- !( grepl(query.n, wname)|grepl('과자', wname)|grepl('ㅠㅠ', wname)|grepl('ㅜㅜ', wname)|grepl('추천', wname)| (wcount<=sort.var))



wname.rel <- wname[idx]
wcount.rel <- wcount[idx]


pal <- c("#B8DF51","#00BB8E","#007F97", "#1D5B88","#41356E", "#009F99", "#65D174" , "#FDE333","#46024E")

wordcloud(wname.rel,freq = wcount.rel, colors = pal,family="AppleGothic",scale=c(10,1))



# 카페 글을 통한 데이터 크롤링

end_num = 1000
display_num = 100
start_point = seq(1,end_num,display_num)

final_dat = NULL
for(i in 1:length(start_point))
{
  # request xml format
  url = paste0('https://openapi.naver.com/v1/search/cafearticle.xml?query=',query,'&display=',display_num,'&start=',start_point[i],'&sort=sim')
  #option header
  url_body = read_xml(GET(url, header), encoding = "UTF-8")
  title = url_body %>% xml_nodes('item title') %>% xml_text()
  cafename = url_body %>% xml_nodes('item cafename') %>% xml_text()
  date = url_body %>% xml_nodes('lastBuildDate') %>% xml_text()
  link = url_body %>% xml_nodes('item link') %>% xml_text()
  description = url_body %>% xml_nodes('item description') %>% html_text()
  temp_dat = cbind(title, date, cafename, link, description)
  final_dat = rbind(final_dat, temp_dat)
  cat(i, '\n')
  
}
final_dat = data.frame(final_dat, stringsAsFactors = F)
names(final_dat)
table(final_dat$cafename)

tmp <- final_dat %>% select(cafename, link) %>%
  filter(cafename %in% names(top.cafename))


tb <- table(pure[,2])
a <- top.blogger<- sort(tb, decreasing = T)[1:8]
tmp <- final_dat %>% select(bloggername, link) %>%
  filter(bloggername %in% names(top.blogger) )

a <- final_dat$postdate

a <- write.csv(a,'a.csv')

library(pspline)
tb <- table(final_dat$postdate)
x <-as.Date(names(tb), format = "%Y%m%d")
y <- as.numeric(tb)
plot(x, y, pch = 19, cex = 0.5)
fit <- sm.spline(x = as.integer(x), y = y, cv = TRUE)
lines(x=x, y=fit$ysmth, lty = 2, col = 'blue')

# zero frequecy
xx <- as.Date(as.integer(min(x)):as.integer(max(x)),
              origin = "1970-01-01")
yy <- rep(0, length(xx))
yy[xx%in%x] <-y
plot(xx,yy, pch = 19, cex = 0.5)
fit<-sm.spline(xx,yy,cv = TRUE)
points(fit$x, fit$ysmth, type = 'l', lty = 2, lwd = 1.5, col = 'blue')

# local polynomial function
xint <- as.integer(xx)
rdata = data.frame(y = yy, x = xint)
fit<-loess(y~x,data = rdata, span = 0.5, normalize = FALSE)
plot(fit, pch = 19, cex = 0.5)
points(fit$x,fit$fitted, type = 'l', lty = 2, lwd = 1.5, col = 'blue')

# K fold cross validation 
k.fold = 5
idx <-sample(1:5, length(xint), replace = TRUE)

k = 1
rdata.tr <- rdata[idx != k, ]
rdata.va <- rdata[idx == k, ]
fit<-loess(y~x,data = rdata.tr, span = 0.1, normalize = FALSE)
fit.y<-predict(fit, newdata = rdata.va)
mean((fit.y-rdata.va$y)^2, na.rm = T)

# loop 

# loop 2
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

# check
boxplot(valid.mat)
lines(colMeans(valid.mat), col = "blue", lty = 2)

# model decision
span.par<- span.var[which.min(colMeans(valid.mat))]
fit<-loess(y~x,data = rdata, 
           span = span.par, normalize = FALSE)
plot(xx,yy, type = 'n', ylab = '검색량',xlab = "'과자추천' 블로그 작성 년도'")
points(xx,fit$fitted, type = 'l', lty = 1, lwd = 4, col = 'blue')


# deletion tag
useSejongDic()
extractNoun(a, autoSpacing = T)
morph.fit <- MorphAnalyzer(a)
morph.fit
dat_tmp <- final_dat
for (i in 1:nrow(final_dat))
{
  dat_tmp[i,3]<-   gsub(pattern = "<[/|A-Za-z]*>", 
                        replace = "", final_dat[i,3])
}
dat_tmp
dat_tmp_sub <- extractNoun(dat_tmp[,3],autoSpacing = T)

# tm package is based on Eng. Addition option is required

text = dat_tmp_sub
cps = Corpus(VectorSource(text))
dtm = tm::DocumentTermMatrix(cps, 
                             control = list(tokenize = extractNoun, 
                                            removeNumber = T,
                                            removePunctuation = T))

str(dtm)
dtm
# matrix class
rmat <- as.matrix(dtm)
class(rmat)
dim(rmat) # 형태소 별 언급 횟수가 나옴

# sparseMatrix

rmat <-spMatrix(dtm$nrow,dtm$ncol, i=dtm$i, j=dtm$j, x=dtm$v)
wcount<-colSums(rmat)
wname <- dtm$dimnames$Terms
wname <- repair_encoding(dtm$dimnames$Terms)


colnames(wcount) <- wname
