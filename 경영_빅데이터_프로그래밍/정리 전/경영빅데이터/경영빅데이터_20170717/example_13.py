# 다시 확인해보기


example = open('enrollments.csv','r')
list1 = example.readlines()
features = list1[0].split(',')
data = []
for i in list1:
	i = i.split(',')
	for j in range(len(features)):
		dic = {}







features = ['accont_key','status','join_data','cancel_data','days_to_cancel','is_udacity','is canceled']
list2 = list1[1:]


a = {}
for i in range(len(features)):
	a[features[i]]=list2[i]
print(a)