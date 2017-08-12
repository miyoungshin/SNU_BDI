# 2-4-3-1 리뷰에서 많이 등장하는 형용사 추출
import nltk
from collections import Counter

lemmatizer = nltk.wordnet.WordNetLemmatizer()


with open('reviews4.txt','r',encoding = 'utf-8') as a :
	lines = a.readlines()
	a.close()   # 파일을 오픈 한뒤에는 꼭 close를 해야함

nounList = []

for i in lines :
	tokens = nltk.word_tokenize(i)
	tags = nltk.pos_tag(tokens)
	for words, tag in tags :
		if tag in ['JJ' or 'JJS' or 'JJR' or 'RB'] : 
			nounList.append(words)


counts = Counter(nounList)
print(counts.most_common(10))

