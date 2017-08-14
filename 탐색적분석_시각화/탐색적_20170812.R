setwd("/Users/arnorfati/Documents/GitHub/SNU_BDI/탐색적분석_시각화")
getwd() # 현재 작업 경로 보여줌
a <- c(1:10)
rm(list=ls()) # 워크스페이스의 객체 지우기
gc() # 메모리 정리
pdf("example.pdf") # pdf 그래픽 디바이스 열기 (작업 디렉토리에 xh라는 파일을 만들어 그곳에 그림을 그림)
#jpg, png, gif 그림을 그려주는 디바이스

hist(rnorm(100))
dev.off()


# 백터 저장
x <- c(1,2,4)
x # print(x)를 생략해서 x로 쓸 수 있음
xx <- c(x,x,8)
x1 <- c(2.1:10) # : 연산자는 첫번째 숫자부터 1씩 더해나감 두번째 연산자를 넘지 않을 때 까지
x2 <- c(21:11)
x <- 5:8
x1 <- x[1:3]
x1
length(x)
x1 <- c(5,0,-4)
x2 <- c(1,2,2)
x1 +x2
x1 * x2
x1 * 2
x1 + c(3,1) # 계산은 되지만 warning message를 줌
c(5,0,-4,2) + c(3,1) # warning message도 주지 않음, R의 재사용 규칙

y <- 1:10-1
y2 <- 1:10*2
y2
y3 <- seq(12,30,2) # sequnce는 자주 쓰임
y4 <- seq(12,30,length = 20) # 양쪽 끝을 포함한 균등 분할

z <- rep(c(5,12,12,13),3)
z <- rep(c(5,12,12,13),each=3) # 각각 3씩  defult 와 each 값은 다름 
z <- rep(c(5,12,12),c(3,2,1))

# 연산자
21%%2 # 나머지
21%/%2 # 몫

u <- c(5,2,8)
v <- c(1,2,9)
u>v

# NA 와 NULL

x <- c(12,NA,32,11,32) # NA는 결측값
mean(x)

mean(x, na.rm=TRUE ) # NA값을 제외하고 평균

x <- NULL # 
x <- c(x,2)
x

z <- c(5,2,-3,8)
w <- z[z>0]
w <- z[c(F,F,F,T)]


z <- c(5,2,-3,8)
z == 5
which(z == 5) # TRUE값을 가지는 값의 위치


#-------------------------------3교시 -------------------------------------------
x <- c(6,1:3,NA,12)
is.na(x)
!is.na(x) # !은 TRUE FALSE를 바꿔주는 연산자
x <- c(3,1,4,1)
any(x>5) # 조건에 만족하는 값이 하나라도 있을 경우

x %in% c(2,1,4) # x 값이 c(2,1,4) 안에 있는지

c(3,2) %in% c(2,1,4) # 각원소가 백터안에 포함되어 있는지 내가 가지고 있는 데이터 중 뽑고 싶은 데이터만

match(3,c(2,1,4))
match(c(1,4),c(2,1,4)) # 위치까지 알려줌, 찾아야 하는 유니크셋(ID)과 접속 기록을 찾는

# data.frame <- list에 array기능을 첨가함
kids <- c("jack","Jill")
ages <- c(12,10)
d <- data.frame(kids,ages)
d <- data.frame(kids,ages,stringsAsFactors = FALSE)
d
str(d)
names(d)
class(d)
class(d$kids)
dd <- unclass(d)
dd
class(dd)

# 절대경로 & 상대경로
getwd() #상대경로를 만들고 그 밑에 추가 경로를 설정해 다른 컴퓨터환경에서도 가능하도록
# setwd(상대경로)
# setwd(./~) '.'은 상위폴더를 의미
# pdf("./AB/asd.pdf")
# pdf("../윗폴더/다른 폴더/asd.pdf")
hist(1:10)
dev.off()


install.packages()
a <- require(glmnet) # 패키지가 있는지 없는지를 알려줌
a
if (  !require(glmnet))
{
  install.packages("glmnet")
  library(glmnet)
}

a <- data.frame(x1 = rep(0,10),x2 = rep('b',10))
b <- data.frame(x1 = rep(1,10),x2 = rep('d',10))
AB <- cbind(a,b)
AB <- rbind(a,b) # 안됨 , 데이터프레임을 리스트를 어레이처럼 보이게 만든거일 뿐 이름이 defualt되어 있기 떄문에
