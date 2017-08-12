a = (1,2)
b = (3,4)


for i in a :
	for j in b :
		if  a.index(i) == b.index(j) :
			print((i - j)**2)
		else:
			continue

