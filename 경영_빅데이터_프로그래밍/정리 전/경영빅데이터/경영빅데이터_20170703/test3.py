def distance(a,b):
	result = 0
	for i in range(2) :
		result += (((a[i]-b[i])**2))
	print((result)**0.5)	



a = [1,2]
b = [5,7]

distance(a,b)