
n = 'KOIOIOI'

KOI=0
IOI=0

for i in range(len(n)) :
	if 'IOI' in n[i:i+3] :
		IOI += 1
	elif 'KOI' in n[i:i+3] :
		KOI += 1

	

print(IOI)
print(KOI)		