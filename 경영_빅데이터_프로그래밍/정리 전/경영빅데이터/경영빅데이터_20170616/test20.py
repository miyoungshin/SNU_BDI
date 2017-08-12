a = int(input('a값을 입력하세요'))
b = int(input('b값을 입력하세요'))
c = int(input('c값을 입력하세요'))

if a > b > c or a > c > b :
	print('a가 제일 큽니다')

elif b > a > c or b > c > a :
	print('b가 제일 큽니다')
elif c > a > b or c > b > a :
	print('c가 제일 큽니다')

print('a는', a)
print('b는', b)
print('c는', c)