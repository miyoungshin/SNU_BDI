from bs4 import BeautifulSoup

web_page = BeautifulSoup(open('simple2.html'), 'html.parser')
# The follwing code demonstrates how to use '.contents'
print("===head=======================================")
print(web_page.head)
#print("===head.contests==============================")
#print(web_page.head.contests)
#print(web_page.head.contests[0])
#print(web_page.head.contests[1])
#print("===title======================================")
#print(web_page.title)
#print("===traversing head.contests ==================")
#for    content in web_page.head.contests :
#	print(content)
web_page.get_text()
print(web_page.get_text())
print(web_pate.get_text(' && '))
print(web_pate.get_text(' && ',strip=True))
