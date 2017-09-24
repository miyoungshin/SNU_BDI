# 강의록 주소 : http://ranking.uos.ac.kr/bigdata.php
setwd('C:/Users/User/Documents/GitHub/SNU_BDI/탐색적분석_시각화')

# 0. 결과 저장

lambda <- 1
for (i in 1:10)
{
  lambda <- i
  save.image(paste0('result_',i,'.Rdata'))
}

source(paste0('result_',i,'.Rata'))

a <- readLines('result_1.Rata')

a[4] <- c('for (i in 2)')



# 문자열 처리 함수
# 1. paste함수
paste('감자로','만든','감자칩',sep ='')
paste('감자로','만든','감자칩',sep =' ')

# 1-1.응용
paste(c('감자로','고구마로'),c('만든 감자칩','만든 고구마칩'),sep = ' ')
paste(1:12,c('st','nd','rd',rep('th',9)))

# 1-2.collapse 활용
paste0(1:12, collapse = '-')
paste(1:4,5:8,sep = ';')
paste(1:4,5:8,sep = ':',collapse = '-')

# 2. grep 함수
grep('pole',c('Equator','North Pole','South pole','poles')) # 대소문자는 구분함

# 3. nchar 함수
nchar(c('South Pole','한글 문자열',NA))

# 4.substr 함수 : 문자열 내 위치 참조
substr('Equator',start = 2,stop = 4)
substr('Equator',2,4) # 생략 가능, substr('Equator',2) 처럼 start나 stop이 없으면 안됨
substring('한글 문자열 추출',2)
cat (a,file = 'test-1.R', sep='\n') 

# 5. strsplit 함수 : 문자열을 분리시키는 함수
strsplit('6-16-2011',split = '-')
strsplit('6*16*2011',split = '*') # '*' 기호는 모든 문자를 의미
# '*'를 개별 문자로 처리하고 싶을때는
strsplit('6*16*2011',split = '*', fixed = TRUE)
strsplit('6*16*2011',split = '\\*')

# 6. regexpr 함수
regexpr('감자','맛있는 감자칩')

# 7. gregexpr 함수 : 문자열 내 일치한 모든 문자의 위치
gregexpr('감자','머리를 감자마자 감자칩을 먹었다.')

# 8. gsub 함수
gsub(pattern = '감자',replacement = '고구마',
     x = '머리를 감자마자 감자칩을 먹었다')



# 정규 표현식
# OR
strsplit('감자, 고구마, 양파 그리고 파이어볼', split='(,)|(그리고)')
paste(1:4,5:8,sep=';',collapse= '-')

# ~로 시작하는 문자열
grep(pattern='^(감자)',x = '감자는 고구마를 좋아해')
grep(pattern='^(감자)',x = '고구마는 감자를 좋아해')

# ~로 끝나는 문자열
grep(pattern='(좋아해)$', x = '감자는 고구마를 좋아해')
grep(pattern='(좋아해)$', x = '고구마는 감자를 좋아해')

#Any (gregexpr함수는 text = 로 표현해야 함)
gregexpr(pattern = '[아자차카]', text = '고구마는 감자를 안좋아해')
