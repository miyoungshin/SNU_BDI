from bs4 import BeautifulSoup
from urllib.request import urlopen

example = open('example.txt','w')

url = 'http://dictionary.cambridge.org/dictionary/learner-english/python'

doc = urlopen(url)

web_page = BeautifulSoup(doc, 'html.parser') 

word = web_page.find(attrs= {'class': 'di-title cdo-section-title-hw'})
definition = web_page.find(attrs={'class':'def'})
example.write(word.get_text()+ ':'+ definition.get_text())
example.close()