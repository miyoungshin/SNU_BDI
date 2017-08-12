# 정올 

num = int(input('홀수를 입력하시오'))

if num % 2 == 0 :
	num = int(input('홀수를 입력하시오'))
else :
	pass

max = num*num

matrix = [[0 for col in range(num)]for row in range(num)]
currentrow = 0
currentcol = int((num-1)/2)

for i in range(1,max+1) :
	if i == 1 :
		matrix[currentrow][currentcol] = i
		currentcol -= 1
		currentrow = num-1
	elif i > 1 and i%num != 0 :
		if currentcol == 0 :
			matrix[currentrow][currentcol] = i
			currentcol = num-1
			currentrow -= 1

		elif currentrow == 0 :
			matrix[currentrow][currentcol] = i
			currentrow = num-1
			currentrow -= 1
		else : 
			matrix[currentrow][currentcol] = i
			currentrow -= 1
			currentcol -= 1

	elif i%num == 0 :
		matrix[currentrow][currentcol] = i
		currentrow -= 1

print(matrix)