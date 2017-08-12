

num = int(input('홀수를 입력하시오'))

if num % 2 == 0 :
	num = int(input('홀수를 입력하시오'))
else :
	pass

max = num*num

matrix = [[0 for col in range(num)]for row in range(num)]
currentrow = 0
currentcol = int((num-1)/2)

for i in range(1,max) :
	if i == 1 :
		matrix[currentrow][currentcol] = i
	elif i > 1 :
		if currentrow == 0 :
			currentcol -= 1
			currentrow = num-1
			matrix[currentrow][currentcol] = i
		elif currentcol == 0 :
			currentcol = num-1
			currentrow -= 1
			matrix[currentrow][currentcol] = i
		else : max%(i-1) == 0 :
			currentrow -= 1
			matrix[currentrow][currentcol] = i
		


print(matrix)