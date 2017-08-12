def Hi() :
	print('Hi profeesor')

def name(name) :
	print('My name is ', name)

Hi()
name('Emily')
name('John')
name('Amy')

a = ['1','2','3']
print(' '.join(a))

a = True
b = 10
while a :
	print('체력이 1 감소했습니다.')
	b -= 1
	if  b == 0 :
		a = False
		print('체력이 모두 고갈되었습니다.')

def factorial (n):
	n*factorial(n-1)
	if n == 1 :
		break
 factorial(4)