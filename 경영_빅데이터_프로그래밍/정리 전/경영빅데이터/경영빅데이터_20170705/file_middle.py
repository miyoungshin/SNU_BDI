import sys

n = int(sys.argv[1])
n2 = int(sys.argv[2])
fn = sys.argv[3]

lines = open('beatles2.txt','r').readlines()
for i in range(n,n2) :
	print(lines[i].rstrip())
