a = [['A','B','C','D','E'],['F','G','H','I','J'],['K','L','M','N','O']]

for i in a :
	for j in i :
		print(j.lower(), end = ' ')     # ' '가 나오면 줄바꿈을 한다.
	print(' ')                          # 줄바꿈을 위해 ' '을 넣어줌  
