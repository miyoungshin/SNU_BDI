install.packages('KoNLP')
library(KoNLP)
final_dat[10,5]
install.packages('rJava')
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(rJava)
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
install.packages('tm')
library(tm)

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
colnames(wcount)<- wname

dim(wname)
str(wcount)
class(wname)

colnames(wcount) <- wname

head(data.frame(wname,wcount))
sort.var <- sort(wcount,decreasing = T)[100]
idx <- !( grepl(query.n, wname)| (wcount<=sort.var) )
wname.rel <- wname[idx]
wcount.rel <- wcount[idx]

library(wordcloud)
wordcloud(wname.rel,freq = wcount.rel)
pal <- brewer.pal(9, "Set1")
wordcloud(wname.rel,freq = wcount.rel, colors = pal)



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


