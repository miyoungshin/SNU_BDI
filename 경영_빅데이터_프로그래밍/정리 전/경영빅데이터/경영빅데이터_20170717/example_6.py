def reverse_text(a,b,c,d,e) :
	l = [a,b,c,d,e]
	l2 = 0
	for i in l:
		if len(i)%2 == 0:
			print(i)
		else :
			print(i[::-1])
			l2 += 1
	print(l2) # return으로 해도 됨


reverse_text('tiger','lion','bear','snake','leopard')
