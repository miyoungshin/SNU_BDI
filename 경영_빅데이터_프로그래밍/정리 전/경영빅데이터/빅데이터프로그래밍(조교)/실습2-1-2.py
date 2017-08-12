def search_element(l,arg) :
	if arg in l :
		print(l.index(arg))
	else :
		print(False)

l = [1,2,3]
e1 = 2
e2 = 10

search_element(l, e1)
search_element(l, e2)
