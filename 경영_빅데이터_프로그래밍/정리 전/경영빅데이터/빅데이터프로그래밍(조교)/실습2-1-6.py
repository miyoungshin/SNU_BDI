def reverse_text(a,b,c,d,e) :
	l = (a,b,c,d,e)
	s = 0
	for i in l :
		if len(i)%2 == 0 :
			print(i)
		else :
			print(i[::-1])
			s += 1
	print(s)


reverse_text('tiger','lion','bear','snake','leopard')
