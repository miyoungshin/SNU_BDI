from bs4 import BeautifulSoup
from urllib.request import urlopen

url = 'http://www.imdb.com/title/tt0110912/?ref_=nv_sr_1'
web = urlopen(url)
source = BeautifulSoup(web, 'html.parser')

director = source.findAll(attrs = {'class' : 'credit_summary_item'})


print((director[0]))