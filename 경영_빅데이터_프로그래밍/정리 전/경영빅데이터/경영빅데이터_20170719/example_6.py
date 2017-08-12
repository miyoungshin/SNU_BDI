# 키워드 추출하기
import nltk
from nltk.corpus import stopwords
from collections import Counter
lemmatizer = nltk.wordnet.WordNetLemmatizer()
stopWords = stopwords.words('english')

with open('reviews4.txt','r',encoding = 'utf-8') as a :
	lines = a.readlines()
	a.close()

nounList = []

for i in lines :
	tokens = nltk.word_tokenize(i)
	tags = nltk.pos_tag(tokens)
	for words, tag in tags :
		if tag == ('NN' or 'NNS' or 'NNP' or 'NNPS') : 
			nounList.append(words)


counts = Counter(nounList)
print(counts.most_common(10))
