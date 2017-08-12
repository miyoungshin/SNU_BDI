
from bs4 import BeautifulSoup
from urllib.request import urlopen 

url = 'https://en.wikipedia.org/wiki/List_of_Presidents_of_the_United_States' # 지정된 url 주소를 url 변수로 저장한다.
web = urlopen(url) # urlopen 함수를 통해 웹페이지를 열고 web 변수 저장한다.
source = BeautifulSoup(web, 'html.parser') # web 변수를 Beautiful Soup 객체로 변환하여 web_page 변수에 저장한다.
print(len(source))