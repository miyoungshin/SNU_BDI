import pandas as pd
Title = ['Skyfall','Lose yourself','Another Brick in the Wall', 'Use Somebody','Teasure']
Artist = ['Adele','Eminem','Pink Floyd','Kings of Leon','Bruno Mars']
Length = ['4:46','5:26','3:59','3:51','2:58']
Year = [2012,202,1979,2008,2013]

data = pd.DataFrame({'Title':Title,'Artist':Artist,'Length':Length,'Year':Year})

print(data)

title = data['Title']

title_lower = []

for i in title :
	title_lower.append(i.lower())

print(title_lower)

data2 = pd.read_excel('animals.xlsx')

name = data2['name']
hair = data2['hair']
feathers = data['feathers']


animals = pd.DataFrame({'name':name,'hair':hair,'feathers':feathers})

# 간단하게 하는 방법 loc메소드를 활용
animals = data2.loc[:,['name','hair','feathers']]

animals.to_excel('animals_2.xlsx')