from bs4 import BeautifulSoup

web_page = BeautifulSoup(open('simple.html'),'html.parser')
print(web_page)