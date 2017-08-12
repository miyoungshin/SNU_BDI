from bs4 import BeautifulSoup
from urllib.request import urlopen

url = 'http://alldic.daum.net/search.do?q=curiosity'
web = urlopen(url)

source = BeautifulSoup(web, 'html.parser')

name = source.findAll(attrs = {'class' : 'search_box'})
name2 = name[0].findAll(attrs= {'class' : 'txt_emph1'})
means = source.findAll(attrs = {'class' : 'list_search'})

print(name2[0].get_text())
print(means[0].get_text())	
