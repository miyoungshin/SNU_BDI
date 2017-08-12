
l = []

while True:
	m = input('단어를 입력하시오 : ')
	if m == 'END':
		break
	else :
		l2 = m.split()
		for i in l2 :
			if i.upper() not in l :
				l.append(i)
		print(" ".join(l))
	
