from bs4 import BeautifulSoup

web_page = BeautifulSoup(open('simple.html'),'html.parser')

print('=== head ====================================')
print(web_page.head)
print('=== head.contents ===========================')
print(web_page.head.contents)
print(web_page.head.contents[0])
print(web_page.head.contents[1])
print('=== title ===================================')
print(web_page.title)
print('=== traversing head.contents ================')
for content in web_page.head.contents :
	print(content)
print('=== traversing head.contents using the .children ==')
for child in web_page.head.children :
	print(child)
print('=== get_text() ==============================')
print(web_page.get_text())