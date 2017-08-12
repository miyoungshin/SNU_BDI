n = input('정수를 입력하시오 :')
l = []


#for i in range(int(n)) :
#	x = input()
#	l.append(x)

x = input('정수를 입력하시오 :')
l = x.split()

m = input('정수를 입력하시오 :')

sum1= 0
sum2= 0
for j in l :
	if (int(m) % int(j)) == 0 :
		sum1 += int(j)
	else : 
		pass

for h in l :
	if int(h) % int(m) == 0 :
		sum2 += int(h)

print(sum1)
print(sum2)


