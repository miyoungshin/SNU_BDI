def calculator(a,b,c,d,e) :
	l = []
	s = (a,b,c,d,e)
	for i in s :
		if i != 0 :
			l.append(i)
		else :
			break
	result = (sum(l),int(sum(l)/len(l)))
	print(result)

calculator(1,2,3,4,5)
calculator(1,2,0,4,5)
