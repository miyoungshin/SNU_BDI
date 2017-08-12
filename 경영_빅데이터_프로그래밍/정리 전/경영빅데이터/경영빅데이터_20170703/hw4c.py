# Assignment Number..: 과제 4 / C 타입
# Author.............: 권 혁 주
# File name..........: hw4c.py
# Written Date.......: 20170704
# Program Description: 새로운 함수 정의하는 방법과 람다 함수를 익힌다.
def area_triangle(h,w): # 
	return(h*w*0.5) # 결과 값을 
print(area_triangle(10,15))

def distance(a,b):
	result = 0
	for i in range(2) :
		result += (((a[i]-b[i])**2))
	print((result)**0.5)	
a = [1,2]
b = [5,7]
distance(a,b)

def count(n):
	if n > 0 :
		print(n) 
		return count(n-1)
	elif n == 0:
		return('zero!!')
print(count(5))

area_triangle_ld = lambda h, w : h*w*0.5
print(area_triangle_ld(10,15))

