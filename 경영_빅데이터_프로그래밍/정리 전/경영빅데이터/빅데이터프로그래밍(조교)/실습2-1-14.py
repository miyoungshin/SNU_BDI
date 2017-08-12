file = open('enrollments.csv','r')
line = []
for i in file:
	line.append(i)
header = line[0]
header = header.split(",")
rowdata = line[1:]
data = []

for i in rowdata:
	data.append(i.split(","))


result = []
for i in data:
	result.append({header[0]:(i[0]),header[1]:(i[1]),header[2]:(i[2]),header[3]:(i[3]),header[4]:(i[4]),header[5]:(i[5]),header[6]:(i[6])})

print(result[0])
