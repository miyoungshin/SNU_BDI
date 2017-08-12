# 안되는 이유 정리하기

def vowel(a):
	s = 0
	for i in a :
		if i == 'a' or 'e' or 'i' or 'o' or'u':
			s += 1
	return s
print(vowel('apples'))
