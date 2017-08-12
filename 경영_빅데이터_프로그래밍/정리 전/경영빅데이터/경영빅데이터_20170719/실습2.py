n = input('정수를 입력하시오 :')


def function(n) :
	result = [] 
	if int(n) % 2 == 0 :
		result.append(0)
		function(n//2)
	else :
		result.append(1)
		function(n//2)
	print(result)

function(n)





