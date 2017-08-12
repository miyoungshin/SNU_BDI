def count(n):
	if n > 0 :
		print(n) 
		return count(n-1)
	elif n == 0:
		return('zero!!')

print(count(5))
