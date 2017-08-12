n = 0
l = []
while n < 10:

	if n == 0 :
		print(0)
		l.append(0)
		n += 1
	elif n == 1 :
		print(1)
		l.append(1)
		n += 1
	else :
		print(sum(l[-2:]))
		l.append(sum(l[-2:]))
		n += 1