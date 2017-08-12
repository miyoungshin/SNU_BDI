# -*- coding: utf-8 -*-

from bs4 import BeautifulSoup
from urllib.request import urlopen

reviews1 = open("reviews4.txt","w",encoding="utf-8")

for i in range(100) :
	url = ('http://www.imdb.com/title/tt0468569/reviews?start='+str(i*10))
	web = urlopen(url)
	doc = BeautifulSoup(web,'html.parser')



	source = doc.find('div', {'id':'tn15content'})
	pars = source.findAll('p')
	text = []
	for par in pars :
		text.append(par.get_text())

	reviewlist = []
	for j in text :
		if ('This review may contain spoilers' not in j) and ('Add another review' not in j) :
			reviews1.write(j.replace('\n',' ').replace('\r', ' '))

