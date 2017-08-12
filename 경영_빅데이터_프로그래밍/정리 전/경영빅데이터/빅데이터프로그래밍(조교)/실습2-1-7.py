def vowel(word) :
	c = 0
	for i in word :
		if i in ('a','e','o','i','u') :	
			c += 1
	return c

print(vowel('apples'))
print(vowel('Her name is Jane'))