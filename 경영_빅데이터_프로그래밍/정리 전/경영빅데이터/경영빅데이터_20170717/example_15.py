# 실습 3 다시 해보기

from bs4 import BeautifulSoup
from urllib.request import urlopen

data = open('data.txt','w')

url = 'http://www.imdb.com/title/tt0110912/?ref_=nv_sr_1'
web = urlopen(url)
doc = (web, 'html.parser')
m_title = doc.findAll(attrs={'class':'title_wrapper'}) # 태그를 찾은다음에 안에서 찾아야 함
d_name = doc.findAll(attrs={'class':'itemprop'})
c_name = doc.findAll(attrs={'class':'cast_list'}) 
