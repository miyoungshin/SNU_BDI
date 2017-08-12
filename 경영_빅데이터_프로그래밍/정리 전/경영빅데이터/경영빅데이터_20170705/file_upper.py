import sys

fn = sys.argv[1]

lines = open('beatles2.txt','r').readlines()
n = len(lines)

for i in range(0,n):
	print(lines[int(i)].upper())