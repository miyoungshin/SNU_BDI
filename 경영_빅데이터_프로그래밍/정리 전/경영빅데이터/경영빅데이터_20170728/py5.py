from bs4 import BeautifulSoup
from urllib.request import urlopen
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
from nltk import pos_tag
url = "http://endic.naver.com/search_example.nhn?sLn=kr&examType=example&query=car&pageNo=1"

web = urlopen(url)

source = BeautifulSoup(web,'html.parser')

list1 = source.findAll('li',{'class':'utb'})

I1 = []
for i in list1 :
	I1.append(i.findAll('span',{'class':'fnt_e09'}))

result = []
I= [i.find('span',{'class':'fnt_e09'}) for i in source.findAll('li',{'class':'utb'})]

for i in I :
	temp = []
	token_list = word_tokenize(i.text)
	for j in token_list :
		temp.append(WordNetLemmatizer().lemmatize(j, pos = 'v'))
	print(' '. join(temp))
	print(pos_tag(temp))

