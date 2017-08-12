a = int(input())
b = int(input())

if b>a:
	a, b = b, a

print(a%b)
print(int(a/b))