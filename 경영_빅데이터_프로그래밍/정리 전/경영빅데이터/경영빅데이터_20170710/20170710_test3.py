from bs4 import BeautifulSoup

simple_page = BeautifulSoup(open('simple.html'), 'html.parser')
print(simple_page.get_text())

simple_page.get_text()

for c in simple_page.stripped_strings:
	print(c)