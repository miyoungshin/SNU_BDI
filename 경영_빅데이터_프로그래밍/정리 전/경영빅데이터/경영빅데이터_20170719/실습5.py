n = input('시험 몇개 봤니?')


scores = list(input('각 과목의 점수를 입력하세요').split(' ')) 

if len(scores) > n :
	print('ERROR')
	quit()
elif len(scores) < n :
	scores.append(input('다른 과목도 입력하세요 :'))

fake = []
for score in scores :
	a = (score/max(scores))*100
	fake.append(a)
print(fake)
