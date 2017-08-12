from bs4 import BeautifulSoup
from urllib.request import urlopen

url = ('http://dictionary.cambridge.org/dictionary/english/python?fallbackFrom=english-korean')
web_page = BeautifulSoup(urlopen(url),'html.parser')
word = (web_page.find(attrs = {'class' : 'headword'}))
definition = (web_page.find(attrs = {'class' : 'def'}))
print(word)
print(definition)
print(word.get_text())
print(definition.get_text())

fout = open('dictionary.txt','w')
fout.write(word.get_text()+' : '+ definition.get_text()) 
# write 메소드는 반드시 하나의 인자값을 받아야함, ','는 여러 인자값으로 인식 +는 하나의 인자값으로 인식
fout.close()
