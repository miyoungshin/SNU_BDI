##### 단어정제 #########

final_dat[10,5]
a <- gsub(pattern = "<[/?A-Za-z]*>", 
          replace = "", final_dat[10,5])
a

# 단어 추출
library(KoNLP)
useSejongDic()

dat_tmp <- final_dat
for (i in 1:nrow(final_dat))
{
  dat_tmp[i,5]<-   gsub(pattern = "<[/|A-Za-z]*>", 
                        replace = "", final_dat[i,5])
}

# 형태소 분석
extractNoun(a)
morph.fit <-MorphAnalyzer(a)
morph.fit[1:2]

install.packages('rJava')
install.packages('tm')

library(tm)
text = dat_tmp[,5]
cps = Corpus(VectorSource(text))
dtm = tm::DocumentTermMatrix(cps, 
                             control = list(tokenize = extractNoun, 
                                            removeNumber = T,
                                            removePunctuation = T))
str(dtm)
rmat <- as.matrix(dtm)
str(rmat)

install.packages('Matrix')
library(Matrix)
T3 <- spMatrix(3,4, i=c(1,3:1), j=c(2,4:2), x=1:4)
T3

rmat <- as.matrix(dtm)
str(rmat)

rmat <-spMatrix(dtm$nrow,dtm$ncol, i=dtm$i, j=dtm$j, x=dtm$v)
head(rmat)

library(rvest)
wcount<-colSums(rmat)
wname <- dtm$dimnames$Terms
wname <- rvest::repair_encoding(dtm$dimnames$Terms)
colnames(rmat)<- wname
str(wname)

sort.var <- sort(wcount,decreasing = T)[100]
idx <- ! (grepl(query.n, wname)| (wcount <- sort.var))
wname.rel <- wname[idx]

sort.var <- sort(wcount,decreasing = T)[100]
idx <- !( grepl(query.n, wname)| (wcount<=sort.var) )
wname.rel <- wname[idx]
wcount.rel <- wcount[idx]

install.packages('wordcloud')
library(wordcloud)
pal <- brewer.pal(9, "Set1")
wordcloud(wname.rel,freq = wcount.rel, colors = pal)

install.packages('tuneR')
library(tuneR)

client_id = 'SpQNuLZl3zQ7XJZ2ZUYg';
client_secret = 'QwLb9G1qiB';

header = add_headers('X-Naver-Client-Id' = client_id,'X-Naver-Client-Secret' = client_secret)
url = paste0("https://openapi.naver.com/v1/voice/tts.bin")
speech = 'jinho'
encText = " "
data = list(speaker = speech,
            speed = 0,
            text = encText)
url_post = POST(url,header, body = data, encode = 'form', write_disk('test.mp3',overwrite = T))
mp3 = readMP3('test.mp3')
play(mp3)


################################################
install.packages('MASS')
library(MASS)
pm <- matrix(c(1,0,0.5,0,1,0.3,0.5,0.3,1),3,3)
pm.reverse <- solve(pm)

  
}