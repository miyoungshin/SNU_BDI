filename = input('Enter a file name :')

fin = open(filename,'r')
f_list = []
for i in fin :
	f_list.append(i.rstrip())


for i in f_list :
	print(f_list.index(i)+1, ':', i)