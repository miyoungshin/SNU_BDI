# 함수를 정의하고 그 속에 임의의 a, i를 설정 그 뒤 print
def find_in_list_for(Seoul, u) :
	
	for a, i in enumerate(Seoul):
		if i == u :
			break
	else :
		a = -1
	return a

print(find_in_list_for('seoul', 'o'))
print(find_in_list_for('adwdqfedwaqdwdsdqq','a'))
