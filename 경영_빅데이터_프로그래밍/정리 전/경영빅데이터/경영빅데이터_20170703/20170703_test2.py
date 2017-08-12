filename = input('Enter a file name:')

with open(filename) as fin:
	lines = fin.readlines()
	for line in range(0, len(lines)) :
		print('{:4}: {}'.format(line + 1, lines[line.restrip()]))
