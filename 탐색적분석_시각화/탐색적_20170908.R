paste('감자로','만든','감자칩',sep ='')

getwd()

#test
lambda <- 1
for (i in 1:10)
  {
  lambda <- i
  save.image(paste0('result_',i,'.Rdata'))
  }

source(paste0('result_',i,'.Rata'))

a <- readLines('result_1.Rata')

a[4] <- c('for (i in 2)')

#  
cat (a,file = 'test-1.R', sep='\n') 

paste(1:4,5:8,sep = ';')

paste(1:4,5:8,sep=';',collapse= '-')

grep('pole',c('Equator','North Pole','South pole','poles'))

substr('한글 문자열 추출', star=2,stop=4)

strsplit('6*16*2011',split = "*",fixed = TRUE) # 특수문자 분리 할때
strsplit('6*16*2011',split = "*") # 안됨

strsplit('6*16*2011',split = '\\*') # *는 모든 문자라는 의미도 가지고 있음


for (i in 1:10) cat(paste(i,'\n'))
for (i in 1:10) cat(paste(i,'\t'))

strsplit(list.files(), split = '.', fixed = TRUE)

# 찾고자 하는 문자의 매칭 위치와 길이
a<-regexpr('감자','맛있는 감자칩')
attr(a,'match.length')

# 찾고자 하는 모든 문자의 매칭 위치와 길이
a <- gregexpr('감자','감자를 감자마자 감자칩을 먹었다.')

#정규 표현식
grep(pattern = '^(감자)',x = '감자는 고구마를 좋아해')
grep(pattern = '^(감자)',x = '고구마는 감자를 안좋아해')

grep(pattern = '(좋아해)$',x = '감자는 고구마를 좋아해')
grep(pattern = '(좋아해)$',x = '고구마는 감자를 안좋아해')

gregexpr(pattern = '[아자차카]', text = '고구마는 감자를 안좋아해')
regexpr(pattern = '[아자차카]', text = '고구마는 감자를 안좋아해')

# 소괄호로 묶는건 -> 안됨
gregexpr(pattern = '[(사과)(감자)(양파)]',text = '고구마는 감자를 안좋아해')

gregexpr(pattern = '^[(사과)(감자)(양파)]',text = '고구마는 감자를 안좋아해')
# -1 은 없다는 의미

grep(pattern = '^[^(사과)(감자)(양파)]',x = '고구마는 감자를 안좋아해')
# []안에 ^이 있으면 except의 의미를 갖는다

grep(pattern = '^ab{2,3}',x = 'ab')
# ^[1-9][0-9]*$ 자연수
# ^(0|([1-9][0-9]*))$ 0을 포함한 자연수


# ------------------웹크롤링 -----------------------------
install.packages('rvest')
install.packages('xml2')
library(rvest)
library(xml2)
library()
url_tvcast = 'http://tv.naver.com/jtbc.youth'
html_tvcast = read_html(x = url_tvcast,encoding = 'UTF-8')

#html_nodes
html_tvcast %>% html_nodes('.title a') %>% html_text() %>%data.frame() %>% head(n=3) # class 속에 tilte을 가지고 있는 a 태그


# 왕은 사랑한다 http://tv.naver.com/mbc.kingloves

url_tvcast = 'http://tv.naver.com/mbc.kingloves'
html_tvcast = read_html(x = url_tvcast,encoding = 'UTF-8')
html_tvcast %>% html_nodes('.title a') %>% html_text() %>% head(n = 3) # class 속에 tilte을 가지고 있는 a 태그


url_wiki = 'https://en.wikipedia.org/wiki/Student%27s_t-distribution'
html_wiki = read_html(x = url_wiki,encoding = 'UTF-8')
tb <- html_wiki %>% html_nodes('.wikitable') %>% html_table() %>% data.frame() 
str(tb)
tb <- as.numeric(tb)


url_mlb = 'https://www.baseball-reference.com/leagues/MLB/2017.shtml'
html_mlb = read_html(x = url_mlb, encoding = 'URF-8')
html_mlb %>% html_nodes('div#div_teams_standard_batting table') %>% html_table() %>% data.frame() 

# 기상청 데이터
Sys.setlocale('LC_ALL','Korean')
Sys.getlocale()
url = 'http://www.kma.go.kr/weather/observation/currentweather.jsp?auto_man=m&type=t99&tm=2017.09.08.07'
html = read_html(x = url, encoding = 'EUC-KR')
tmp <- html %>% html_nodes('table.table_develop3') %>% html_table(header = FALSE, fill=TRUE) %>% data.frame() 
head(tmp)


