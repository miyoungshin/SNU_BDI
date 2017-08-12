l = {'John':30000,'Jane':50000,'Paul':45000,'Elizabeth':70000,'Seth':10000}
a = list(l.keys())
b = list(l.values())
for i in range(len(b)) :
	if b[i] >= 50000:
		print("%d's salary is:",b[i] % a[i])
