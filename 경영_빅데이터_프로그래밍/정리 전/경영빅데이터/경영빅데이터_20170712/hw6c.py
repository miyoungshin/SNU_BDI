# Assignment Number..: 과제 6 / C 타입
# Author.............: 권 혁 주
# File name..........: hw6c.py
# Written Date.......: 20170711
# Program Description: HTML과 웹 크롤링의 기초를 익혀 웹 크롤링을 실습한다.
from bs4 import BeautifulSoup # bs4패키지에서 BeautifulSoip을 불러온다.
from urllib.request import urlopen # urllib 패키지에서 request.urlopen을 불러온다.

url = 'https://en.wikipedia.org/wiki/List_of_Presidents_of_the_United_States' # 지정된 url 주소를 url 변수로 저장한다.
web = urlopen(url) # urlopen 함수를 통해 웹페이지를 열고 web 변수 저장한다.
source = BeautifulSoup(web, 'html.parser') # web 변수를 Beautiful Soup 객체로 변환하여 web_page 변수에 저장한다.

table = source.findAll(attrs = {'class': 'wikitable'}) # 크롤링할 부분의 텍스트를 	table에 저장한다.
presidents = table[0].findAll('big') # 지정된 url에서 표가 3개 이기에 그 중 해당되는 제일 처음 표의 대통령을 찾기 위해 findAll을 활용한다.

for i in presidents[0:10]: # 앞의 10명의 대통령 이름을 출력하기 위해 for문과 get_text() 활용한다.
	print(i.get_text())
