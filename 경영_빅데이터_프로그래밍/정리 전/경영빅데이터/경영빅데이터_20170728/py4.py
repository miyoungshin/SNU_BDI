# 웹크롤링 + 자연어
from bs4 import BeautifulSoup
from urllib.request import urlopen

url = 'http://endic.naver.com/search_example.nhn?sLn=kr&examType=example&query=car&pageNo=1'

web = urlopen(url)

source = BeautifulSoup(web, 'html.parser')

#list1 = source.findAll('ul', {'class':'list_a list_a_mar'})
# findAll이 두개면 안되는지 확인 
list1 = source.findAll('li',{'class':'utb'})

#list2 = source.findAll('span',{'class':'fnt_e09'})
I = []
print(type(source))
print(type(list1))
for i in list1 :
	I.append(i.findAll('span',{'class':'fnt_e09'}))

# 리스트 축얃
#example_list= [i.find('span',{'class':'fnt_e09'}) for i in list1]


# 한번에 합치기 
example_list= [i.find('span',{'class':'fnt_e09'}) for i in source.findAll('li',{'class':'utb'})]

for i in example_list :
	print(i.get_text())