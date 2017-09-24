# 한 건당 1000개씩 밖에 검색 안됨, 


# NAVER API
Sys.setlocale("LC_ALL", "Korean")
rm(list = ls())
library(httr)
library(rvest)
library(dplyr)
library(pspline)
library(KoNLP)
library(rJava)
library(tm)



Sys.setlocale("LC_ALL", "Korean")
client_id = 'aaoFMXW56HWyxt1gsLqj';
client_secret = 'bbx6GpYpRw';

# add header? (add information of id and password)
header = httr::add_headers('X-Naver-Client-Id' = client_id,
                           'X-Naver-Client-Secret' = client_secret)

# 허니버터칩을 UTF-8 코드로 변환
query.n =  query = '과자'
# convert encoding 
query = iconv(query, to = 'UTF-8', toRaw = T)
query = paste0('%', paste(unlist(query), collapse = '%'))
query = toupper(query)

# make URL
end_num = 2000
display_num = 100
start_point = seq(1,end_num,display_num)

# 불러 올 데이터 확보
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

# 데이터 타입 확인
str(final_dat)

# 블로그 명 확인
tb <- table(final_dat[,2])
top.blogger<- sort(tb, decreasing = T)[1:4] # 상위 4명의 블로그 확인

final_dat[final_dat[,2]== '로즈마리세상',5]
tmp <- final_dat %>% select(bloggername, link) %>%
  filter(bloggername %in% names(top.blogger) )

tb <- table(final_dat$postdate)
head(tb)
table(tb)
names(tb) %>%head() # 문자열로 데이터 정리
x <- as.Date(names(tb), format = '%Y%m%d')
y <- as.numeric(tb) # 검색량
# 데이터의 날짜에 관한 전처리
?strptime

plot(x,y,pch = 19,cex = 0.5)



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




final_dat[10,5]

# 정규표현식
a <- gsub(pattern = "<[/?A-Za-z]*>", 
          replace = "", final_dat[10,5])

# deletion tag
useSejongDic()
extractNoun(a, autoSpacing = T)
morph.fit <- MorphAnalyzer(a)
morph.fit
dat_tmp <- final_dat
for (i in 1:nrow(final_dat))
{
  dat_tmp[i,5]<-   gsub(pattern = "<[/|A-Za-z]*>", 
                        replace = "", final_dat[i,5])
}
dat_tmp
dat_tmp_sub <- extractNoun(dat_tmp[,5],autoSpacing = T)

# tm package is based on Eng. Addition option is required

text = dat_tmp[,5]
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
write.csv(rmat,'a.csv')
# sparseMatrix
library(Matrix)
rmat <-spMatrix(dtm$nrow,dtm$ncol, i=dtm$i, j=dtm$j, x=dtm$v)
wcount<-colSums(rmat)
wname <- dtm$dimnames$Terms
wname <- repair_encoding(dtm$dimnames$Terms)


dim(wname)
str(wcount)
class(wname)

colnames(wcount) <- wname

a <- (data.frame(wname,wcount))
sort.var <- sort(wcount,decreasing = T)[100]
idx <- !( grepl(query.n, wname)| (wcount<=sort.var) )
wname.rel <- wname[idx]
wcount.rel <- wcount[idx]

install.packages("wordcloud")
library(wordcloud)
wordcloud(wname.rel,freq = wcount.rel)
pal <- brewer.pal(9, "Set1")
wordcloud(wname.rel,freq = wcount.rel, colors = pal,family="AppleGothic")



dtm = as.matrix(dtm)
dim(dtm)
View(dtm)

bb <- rmat
bb.freq <- sort(colSums(bb), decreasing = T)
plot(bb.freq, pch = 19, type = 'l')

bb.freq <- bb.freq[bb.freq>quantile(bb.freq,0.99)]
idx <- match(names(bb.freq),  colnames(bb))
bb.r <- bb[,idx]
head(bb.r)
dim(bb.r)
bb.r <- as.matrix(bb.r)
cor.mat <- cor(bb.r)
image(cor.mat)
library(rgl)
persp3d(cor.mat, col = "yellow4")
sort(cor.mat[1,], decreasing = T)[1:10]



# clova speech synthesis
# description 
# https://developers.naver.com/docs/clova/api/#/CSS/API_Guide.md#Preparation

#install.packages("tuneR")
library(tuneR)
header = add_headers('X-Naver-Client-Id' = client_id,'X-Naver-Client-Secret' = client_secret)
url = paste0("https://openapi.naver.com/v1/voice/tts.bin")
speech = 'jinho'
encText = "�덈뀞�섏꽭��"
data = list(speaker = speech,
            speed = 0,
            text = encText)
url_post = POST(url,header, body = data, encode = 'form', write_disk('test.mp3',overwrite = T))
mp3 = readMP3('test.mp3')
play(mp3)


library(MASS)

Omega  = matrix(c(1,0,0.5,
                  0,1,0.3,
                  0.5,0.3,1)
                ,3,3)

Sigma <- solve(Omega)
n = 100
pcor.vec <- rep(0,1000)
for ( i in 1:1000)
{
  rdata<-mvrnorm(n,mu = rep(0,3), Sigma)
  x = rdata[,1]
  y = rdata[,2]
  z = rdata[,3]
  
  x = x-mean(x)
  y = y-mean(y)
  z = z-mean(z)
  
  pcor.vec[i]<-cor(lm(x~z-1)$residual,lm(y~z-1)$residual)
  
}

boxplot(pcor.vec)


