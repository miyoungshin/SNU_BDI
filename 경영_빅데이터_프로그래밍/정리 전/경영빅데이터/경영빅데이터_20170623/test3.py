## 복습하기

def find_in_list_except(l, target):
	try:
		index = l.index(target)
	except ValueError:
		index = -1
	return index

print(find_in_list_except(seoul,e))