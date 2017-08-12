i = 1
j = 1

while i < 10 :
	while j < 10 :
		print(i,'*',j, '=', i*j, end=" ")
		j += 1
	j -= 9
	print(" ")
	i += 1	
