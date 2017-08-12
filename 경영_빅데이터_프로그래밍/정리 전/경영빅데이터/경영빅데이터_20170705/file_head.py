import sys

x =int(sys.argv[1])
fin = sys.argv[2]

lines = open('beatles2.txt','r').readlines()

for i in range(0,x):
	print(lines[i].rstrip())
	
