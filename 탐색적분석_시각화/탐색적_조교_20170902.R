rm(list = ls())

# vector 형식으로 지정
a = c(xleft = 5,ybottom = 7,xright = 10, ytop = 10)
class(a) = 'rect'
str(a)
head(a)
attributes(a)

# list 형식으로 지정
b = list(center = c(0,10), raduis = 3)
class(b) = 'circle'
str(b)

area = function(x) {
  UseMethod('area',x)
}


area.rect = function(x) {
  as.numeric((x['xright']=x['xleft'])*(x['ytop']-x['ybottom']))
}

area.circle = function(x) {
  as.numeric(pi*x$radius^2)
}

methods('area')
area(a)
area(b)


# S4 클래스
a = c(xleft = 5,ybottom = 7,xright = 10, ytop = 10)

setClass('rect',
         representation(
           xleft = 'numeric',
           xright = 'numeric',
           ytop = 'numeric',
           ybottom = 'numeric')
         )
exmaple <- new('rect',xleft=5,xright=5,ybottom=7,ytop=10)
setMethod(plot,rect,function(x){
  
})
rect@xleft <- c(5)
rect@xright <- c(10)
rect@ybottom <- c(7)
rect@ytop <- c(10)

setClass("jjj", representation( name ="character", salary = "matrix", union = "logical") )

a4 <- new('jjj') 
a4@name <- c('a', 'b') 
a4@salary<- matrix(1,1,1) 
a4@union <- c(T,F) 
slot(a4,'union') <- c(F,F)

############### 객체 저장하기 ######################################################
rm(list = ls(pattern = 'employee'))
save(a4,file='s4class.rdata')
save.image('s4class_1.rdata')
rm(list=ls())
load('s4class.rdata')
ls()

a = matrix(1:1000,1000,10)
write.csv()
write.table(a,'a.csv',sep = ' ',col.names = F,row.names = F)
aa = file('a.csv',open='r')
readLines(aa,n=4)
close(aa)


p = url('http://egloos.zum.com/zoot235/v/10088226', open = 'r') 
ch.vec = c() 
idx = 1 
while(TRUE) { 
  tmp = readLines(p,n=1, warn = FALSE,encoding = 'UTF-8') 
  if (length(tmp) == 0 ) break
  ch.vec[idx] = tmp 
  idx = idx + 1
} 
close(p) 
ch.vec[1:10]


idx = 1 
f1.layer.url = c() 
for ( i in 1:length(pn.num)) 
  {
  tmp = f1.layer.list[[i]] j = 1 
  for ( j in 1:length(tmp)) 
    { 
      tmp1= tmp[[j]] 
      v = grep("/site/data/html_dir/[0-9]{4}/[0-9]{2}", tmp1)  #0~ 9사이의 숫자가 4번 들어가면 TRUE~ 
      #if (length(v)>0 ) break 
      if (length(v) > 0) 
      { 
        a = regexpr("href=", tmp1 ) 
        b = regexpr("[0-9]{13}.html", tmp1 )
        f1.layer.url[idx] = substr(tmp1,a+6, b+17) 
        idx = idx + 1 
      }
    }
}

pn.num = c(1:2) 
idx = 1
f1.layer.list = vector('list', length = length(pn.num)) 
f1.layer.url = c()
for ( i in 1:length(pn.num))
  { 
  tmp = f1.layer.list[[i]]
  j = 1
  for ( j in 1:length(tmp))
    {
    tmp1= tmp[[j]]
    v = grep("/site/data/html_dir/[0-9]{4}/[0-9]{2}", tmp1 )
  #if (length(v)>0 ) break
    if (length(v) > 0)
      {
        a = regexpr("href=", tmp1 )
        b = regexpr("[0-9]{13}.html", tmp1 )

        f1.layer.url[idx] = substr(tmp1,a+6, b+17)
        idx = idx + 1
    }
  }
}

i = 2
p = url(paste('http://biz.chosun.com',f1.layer.url[i], sep=''),open='r')
ch.vec = c()
while(TRUE)
{
  temp = readLines(p,n=1,warn = FALSE, encoding = 'UTF-8')
  if (length(tmp) == 0) break
  dh.vec[idx] = tmp
  idx =idx+1
}
close(p)

rec = FALSE
tmp1= list()
idx = 1
idx = 1
for (i in 1 : length(ch.vec)) {
  v = grep('<!-- article -->', ch.vec[[i]])
  if (length(v) > 0 ) rec <- !rec
  if (rec)
}