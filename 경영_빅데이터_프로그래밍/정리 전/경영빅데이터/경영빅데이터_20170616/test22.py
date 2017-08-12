a = int(input('a의 값이 무엇입니까 :'))
b = int(input('b의 값이 무엇입니까 :'))

if a > b :
	print(a%b)
elif b > a :
	print(b%a)

print('a값은', a)
print('b값은', b)
print('큰 값을 작은 값으로 나눈 나머지는', a%b or b%a)

# if b > a: a, b = b, a 