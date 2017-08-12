import nltk
from nltk.corpus import stopwords
from collections import Counter
lemmatizer = nltk.wordnet.WordNetLemmatizer()
stopWords = stopwords.words('english')
# 오픈 -> 

with open('reviews4.txt','r',encoding = 'utf-8') as a :
	lines = a.readlines()
	a.close()

reviewprocessedList = []

for line in lines :
	reviewprocessed = ''
	tokens = nltk.word_tokenize(line)
	for token in tokens :
		if token.lower() not in stopWords:
			reviewprocessed += ' ' + lemmatizer.lemmatize(token)
	reviewprocessedList.append(reviewprocessed)

with open('reviews5.txt','w',encoding = 'utf-8') as b :
	for reviewprocessed in reviewprocessedList:
		b.write(reviewprocessed+ '\n')
	b.close