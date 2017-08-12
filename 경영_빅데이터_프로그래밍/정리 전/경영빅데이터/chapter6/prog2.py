from bs4 import BeautifulSoup

web_page = BeautifulSoup(open('simple.html'),'html.parser')

print('=== head ====================================')
print(web_page.head)
print('=== title ===================================')
print(web_page.title)
print('=== body ====================================')
print(web_page.body)
print('=== body.h1 =================================')
print(web_page.body.h1)
print('=== The first body.p ========================')
print(web_page.body.p)
print("=== find_all('a') ===========================")
print(web_page.find_all('p'))