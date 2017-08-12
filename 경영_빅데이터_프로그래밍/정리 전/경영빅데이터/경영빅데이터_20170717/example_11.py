a = {'John':30000,'Jane':50000,'Paul':45000,'Elizabeth':70000,'Seth':10000}

name = input('이름을 입력하세요')


print(name,"'s salary is : ",a[name])
#  왜 안되는지 확인 해야함 -> print(name+"'s salary is : "+a[name]) a[name]이 숫자라서

b = a.keys
for i in b :
	if b >= 50000:
		print(a[i])