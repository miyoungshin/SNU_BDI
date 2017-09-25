
# NAVER API------------------------------------------------------------------------------------------------

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

client_id = 'aaoFMXW56HWyxt1gsLqj';
client_secret = 'bbx6GpYpRw';

# add header? (add information of id and password)
header = httr::add_headers('X-Naver-Client-Id' = client_id,
                           'X-Naver-Client-Secret' = client_secret)



# UTF-8 코드로 변환------------------------------------------------------------------------------------------------
query.n =  query = '허니버터칩'
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

# 날짜에 관한 전처리 --------------------------------------------------------------------------------------------------

tb <- table(final_dat$postdate)
head(tb)
table(tb)
names(tb) %>%head() # 문자열로 데이터 정리
x <- as.Date(names(tb), format = '%Y%m%d')
y <- as.numeric(tb) # 검색량



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


# 정규표현식 & 워드 클라우드---------------------------------------------------------------------------------------------------------
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


pal <- brewer.pal(9, "Set1")
wordcloud(wname.rel,freq = wcount.rel, colors = pal,family="AppleGothic")



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
  bloggername = url_body %>% xml_nodes('item bloggername') %>% xml_text()
  postdate = url_body %>% xml_nodes('postdate') %>% xml_text()
  link = url_body %>% xml_nodes('item link') %>% xml_text()
  description = url_body %>% xml_nodes('item description') %>% html_text()
  temp_dat = cbind(title, bloggername, postdate, link, description)
  final_dat = rbind(final_dat, temp_dat)
  cat(i, '\n')
  
}
final_dat = data.frame(final_dat, stringsAsFactors = F)

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
dat_tmp_sub <- extractNoun(dat_tmp[,5],autoSpacing = T)

# tm package is based on Eng. Addition option is required

text = dat_tmp[,3]
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


dim(wname)
str(wcount)
class(wname)

colnames(wcount) <- wname

a <- (data.frame(wname,wcount))
sort.var <- sort(wcount,decreasing = T)[100]
idx <- !( grepl(query.n, wname)| (wcount<=sort.var) )
wname.rel <- wname[idx]
wcount.rel <- wcount[idx]


pal <- brewer.pal(9, "Set1")
wordcloud(wname.rel,freq = wcount.rel, colors = pal,family="AppleGothic")



# 그래피컬

rm(list = ls())

data("Groceries")
head(Groceries)
class(Groceries)
str(Groceries)
summary(Groceries)
rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.5))

?apriori

# transaction class
# list type
a_list <- list(
  c("a","b","c"),
  c("a","b"),
  c("a","b","d"),
  c("c","e"),
  c("a","b","d","e")
)

## set transaction names
names(a_list) <- paste("Tr",c(1:5), sep = "")
a_list
## coerce into transactions
## transaction class is defined by 'arulesViz'
trans1 <- as(a_list, "transactions")
summary(trans1)
str(trans1)
image(trans1)


# matrix type
a_matrix <- matrix(c(
  1,1,1,0,0,
  1,1,0,0,0,
  1,1,0,1,0,
  0,0,1,0,1,
  1,1,0,1,1
), ncol = 5)

## set dim names
dimnames(a_matrix) <- list(paste("Tr",c(1:5), sep = ""),
                           c("가","나","다","라","마"))
a_matrix
trans2 <- as(a_matrix, "transactions")
trans2
rules <- apriori(trans2, parameter=list(support=0.001, confidence=0.01))
inspect(head(sort(rules, by ="lift"),3))

# see transactions-class{arules}

# apriori algorithm
rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.5))
inspect(head(arules::sort(rules, by ="lift"),3))
plot(rules, method = NULL, measure = "support", shading = "lift")
plot(rules, measure=c("support", "lift"), shading="confidence")
# �쐎rder,�� i.e., the number of items contained in the rule
plot(rules, shading="order", control=list(main = "Two-key plot"))

sel <- plot(rules, measure=c("support", "lift"), shading="confidence", interactive=TRUE)

rules%>%quality()


subrules <- head(sort(rules, by="lift"), 10)
plot(subrules, method="graph",measure = 'lift',
     shading = 'confidence')

## graphical model 

x<-matrix(rnorm(50*20),ncol=20)
s<- var(x)
a<-glasso(s, rho=.01)
aa<-glasso(s,rho=.02, w.init=a$w, wi.init=a$wi)
aa$wi
