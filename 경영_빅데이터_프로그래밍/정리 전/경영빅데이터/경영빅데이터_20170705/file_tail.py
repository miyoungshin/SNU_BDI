import sys

n = int(sys.argv[1])
fn = sys.argv[2]

lines = open('beatles2.txt','r').readlines()
for i in reverse(range(n)) :
	print(lines[i].rstrip())
